import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import '../../models/note_model.dart';

class NoteBlocState extends Equatable {
  final NoteModel? currentNote;
  final bool isLoading;
  final List<NoteModel> notes;
  final bool isSaving;
  final TextEditingController? noteTextController;
  final TextEditingController? noteTitleController;

  const NoteBlocState({
    required this.currentNote,
    required this.isLoading,
    required this.notes,
    required this.isSaving,
    required this.noteTextController,
    required this.noteTitleController,
  });

  factory NoteBlocState.initial() => const NoteBlocState(
        isSaving: false,
        currentNote: null,
        isLoading: false,
        notes: [],
        noteTextController: null,
        noteTitleController: null,
      );

  @override
  List<Object> get props =>
      [currentNote.toString(), isLoading, notes, isSaving];

  @override
  String toString() {
    return 'NoteBlocState(currentNote: $currentNote, isLoading: $isLoading, notes: $notes, isSaving: $isSaving)';
  }

  NoteBlocState copyWith({
    NoteModel? currentNote,
    bool? isLoading,
    List<NoteModel>? notes,
    bool? isSaving,
    TextEditingController? noteTextController,
    TextEditingController? noteTitleController,
  }) {
    return NoteBlocState(
      currentNote: currentNote ?? this.currentNote,
      isLoading: isLoading ?? this.isLoading,
      notes: notes ?? this.notes,
      isSaving: isSaving ?? this.isSaving,
      noteTextController: noteTextController ?? this.noteTextController,
      noteTitleController: noteTitleController ?? this.noteTitleController,
    );
  }
}
