import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../models/note_model.dart';
import 'note_events.dart';
import 'note_states.dart';

class NoteBloc extends Bloc<NoteBlocEvent, NoteBlocState> {
  NoteBloc() : super(NoteBlocState.initial()) {
    _init();
  }

  void _init() {
    on<CreateNote>((event, emit) {
      emit(state.copyWith(isLoading: true));

      NoteModel newNote = NoteModel(
        creationDate: DateTime.now(),
        lastUpdated: DateTime.now(),
        uuid: const Uuid().v4(),
      );

      emit(state.copyWith(
        currentNote: newNote,
        notes: [...state.notes, newNote],
        isLoading: false,
        isEditing: true,
        noteTextController: TextEditingController(),
        noteTitleController: TextEditingController(),
      ));
    });

    on<ChangeNote>((event, emit) {
      emit(state.copyWith(isLoading: true));
      List<NoteModel> notes = state.notes
        ..removeWhere((note) => note.uuid == event.newNote.uuid);
      NoteModel newNote = event.newNote;

      emit(state.copyWith(
        currentNote: newNote,
        notes: [...notes, newNote],
        noteTextController: TextEditingController(text: newNote.text),
        noteTitleController: TextEditingController(text: newNote.title),
        isLoading: false,
      ));
    });

    on<DeleteNote>((event, emit) {
      emit(state.copyWith(isLoading: true));

      List<NoteModel> notes = state.notes
        ..removeWhere((note) => note.uuid == event.noteId);

      emit(state.copyWith(
        notes: [...notes],
        isLoading: false,
      ));
    });

    on<ChangeEditMode>(
      (event, emit) {
        emit(state.copyWith(isEditing: !state.isEditing));
      },
    );

    on<SaveNoteChanges>(
      (event, emit) {
        if (state.noteTextController!.text != "") {
          emit(state.copyWith(isLoading: true));

          NoteModel updatedNote = state.currentNote!;

          updatedNote.text = state.noteTextController!.text;
          if (state.noteTitleController!.text.isEmpty) {
            if (state.noteTextController!.text.length < 10) {
              updatedNote.title = "New Note";
            } else {
              updatedNote.title =
                  state.noteTextController!.text.substring(0, 10);
            }
          } else {
            updatedNote.title = state.noteTitleController!.text;
          }

          emit(state.copyWith(
            currentNote: updatedNote,
            isLoading: false,
          ));
        }
      },
    );
  }
}
