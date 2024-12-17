import 'dart:convert';

import '../../models/note_model.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:isar/isar.dart';

part 'sync_event.dart';
part 'sync_state.dart';

class SyncBloc extends Bloc<SyncEvent, SyncState> {
  final Isar isar;
  final String firebaseUrl;
  final String apiKey;
  String idToken;

  SyncBloc({
    required this.isar,
    required this.firebaseUrl,
    required this.apiKey,
    required this.idToken,
  }) : super(SyncInitial()) {
    on<SyncIsarToFirebase>(_handleSyncIsarToFirebase);
    on<SyncFirebaseToIsar>(_handleSyncFirebaseToIsar);
  }

  Future<void> _handleSyncIsarToFirebase(
    SyncIsarToFirebase event,
    Emitter<SyncState> emit,
  ) async {
    emit(SyncLoading());

    try {
      final notes = await isar.noteModels.where().findAll();
      for (var note in notes) {
        await _addOrUpdateNoteToFirebase(note);
      }
      emit(SyncSuccess());
    } catch (e) {
      emit(SyncFailure(error: e.toString()));
    }
  }

  Future<void> _handleSyncFirebaseToIsar(
    SyncFirebaseToIsar event,
    Emitter<SyncState> emit,
  ) async {
    emit(SyncLoading());
    try {
      final response =
          await http.get(Uri.parse('$firebaseUrl/notes.json?auth=$idToken'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        final notes = data.entries.map((entry) {
          final noteMap = entry.value['fields'];
          return NoteModel.fromMap(noteMap);
        }).toList();

        await isar.writeTxn(() async {
          for (var note in notes) {
            await isar.noteModels.put(note);
          }
        });
        emit(SyncSuccess());
      } else {
        emit(
          SyncFailure(
            error:
                'Failed to fetch data from Firebase. Status code: ${response.statusCode}',
          ),
        );
      }
    } catch (e) {
      emit(SyncFailure(error: e.toString()));
    }
  }

  Future<void> _addOrUpdateNoteToFirebase(NoteModel note) async {
    final url = '$firebaseUrl/notes/${note.uuid}.json?auth=$idToken';
    final body = jsonEncode({
      'fields': note.toMap(),
    });

    var response = await http.put(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: body,
    );

    if (response.statusCode == 401) {
      await refreshIdToken();
      response = await http.put(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: body,
      );
    }

    if (response.statusCode != 200) {
      throw Exception('Failed to add or update note on Firebase');
    }
  }

  Future<void> refreshIdToken() async {
    const secureStorage = FlutterSecureStorage();
    String? refreshToken = await secureStorage.read(key: "refreshToken");

    if (refreshToken == null) {
      throw Exception("Refresh token not found.");
    }

    final url = 'https://securetoken.googleapis.com/v1/token?key=$apiKey';
    final body = jsonEncode({
      'grant_type': 'refresh_token',
      'refresh_token': refreshToken,
    });

    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: body,
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final newIdToken = data['id_token'];
      await secureStorage.write(key: "idToken", value: newIdToken);
      idToken = newIdToken;
    } else {
      throw Exception('Failed to refresh ID Token');
    }
  }
}
