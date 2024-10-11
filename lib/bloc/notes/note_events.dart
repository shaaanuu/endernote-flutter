import 'package:equatable/equatable.dart';

import '../../models/note_model.dart';

abstract class NoteBlocEvent extends Equatable {}

class CreateNote extends NoteBlocEvent {
  @override
  List<Object?> get props => [];
}

class ChangeNote extends NoteBlocEvent {
  final NoteModel newNote;

  ChangeNote({required this.newNote});

  @override
  List<Object?> get props => [newNote];
}

class DeleteNote extends NoteBlocEvent {
  final String noteId;

  DeleteNote({required this.noteId});

  @override
  List<Object?> get props => [noteId];
}

class SaveNoteChanges extends NoteBlocEvent {
  @override
  List<Object?> get props => [];
}

class LoadNotes extends NoteBlocEvent {
  @override
  List<Object?> get props => [];
}

class ToggleFavorite extends NoteBlocEvent {
  final NoteModel note;

  ToggleFavorite(this.note);

  @override
  List<Object?> get props => [note];
}
