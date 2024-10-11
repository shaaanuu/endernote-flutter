import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';

import '../../models/note_model.dart';
import 'note_events.dart';
import 'note_states.dart';

class NoteBloc extends Bloc<NoteBlocEvent, NoteBlocState> {
  final Isar isar;

  NoteBloc({required this.isar}) : super(NoteBlocState.initial()) {
    _init();
  }

  void _init() {
    on<CreateNote>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      NoteModel newNote = NoteModel(
        creationDate: DateTime.now(),
        lastUpdated: DateTime.now(),
        uuid: const Uuid().v4(),
      );

      await isar.writeTxn(() async {
        await isar.noteModels.put(newNote);
      });

      emit(state.copyWith(
        currentNote: newNote,
        notes: [...state.notes, newNote],
        isLoading: false,
        noteTextController: TextEditingController(),
        noteTitleController: TextEditingController(),
      ));
    });

    on<ChangeNote>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      List<NoteModel> notes = state.notes
        ..removeWhere((note) => note.uuid == event.newNote.uuid);
      NoteModel newNote = event.newNote;

      await isar.writeTxn(() async {
        await isar.noteModels.put(newNote);
      });

      emit(state.copyWith(
        currentNote: newNote,
        notes: [...notes, newNote],
        noteTextController: TextEditingController(text: newNote.text),
        noteTitleController: TextEditingController(text: newNote.title),
        isLoading: false,
      ));
    });

    on<DeleteNote>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      List<NoteModel> notes = state.notes
        ..removeWhere((note) => note.uuid == event.noteId);

      await isar.writeTxn(() async {
        await isar.noteModels.deleteByUuid(event.noteId);
      });

      emit(state.copyWith(
        notes: [...notes],
        isLoading: false,
      ));
    });

    on<SaveNoteChanges>((event, emit) async {
      if (state.noteTextController?.text.isNotEmpty ?? false) {
        emit(state.copyWith(isLoading: true));

        NoteModel? updatedNote = state.currentNote;
        if (updatedNote != null) {
          updatedNote.text = state.noteTextController!.text;

          final noteTitleText = state.noteTitleController?.text ?? "";
          if (noteTitleText.isEmpty) {
            String firstLine = state.noteTextController!.text.split("\n").first;
            updatedNote.title = (firstLine.length >= 10)
                ? firstLine.substring(0, 10)
                : firstLine;
          } else {
            updatedNote.title = noteTitleText;
          }

          try {
            await isar.writeTxn(() async {
              await isar.noteModels.put(updatedNote);
            });

            emit(state.copyWith(
              currentNote: updatedNote,
              isLoading: false,
            ));
          } catch (e) {
            emit(state.copyWith(isLoading: false));
          }
        }
      }
    });

    on<LoadNotes>((event, emit) async {
      try {
        emit(state.copyWith(isLoading: true));

        final notes = await isar.noteModels.where().findAll();

        emit(state.copyWith(notes: notes, isLoading: false));
      } catch (e) {
        emit(state.copyWith(isLoading: false));
      }
    });

    on<ToggleFavorite>((event, emit) async {
      try {
        emit(state.copyWith(isLoading: true));

        final existingNote = await isar.noteModels
            .where()
            .uuidEqualTo(event.note.uuid)
            .findFirst();

        NoteModel updatedNote = existingNote!.copyWith(
          isFavorite: !existingNote.isFavorite,
        );

        await isar.writeTxn(() async {
          await isar.noteModels.putByUuid(updatedNote);
        });

        // Updating the notes list after toggling
        List<NoteModel> updatedNotes = state.notes
          ..removeWhere((note) => note.uuid == updatedNote.uuid)
          ..add(updatedNote);

        emit(state.copyWith(
          notes: updatedNotes,
          isLoading: false,
        ));
      } catch (e) {
        emit(state.copyWith(isLoading: false));
      }
    });
  }
}
