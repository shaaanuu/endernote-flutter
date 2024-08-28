import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/notes/note_bloc.dart';
import '../../../bloc/notes/note_events.dart';
import '../../../bloc/notes/note_states.dart';
import 'edit_mode/edit_mode.dart';
import 'preview_mode/preview_mode.dart';

TextEditingController textControl = TextEditingController();

class ScreenCanvas extends StatefulWidget {
  const ScreenCanvas({super.key});

  @override
  State<ScreenCanvas> createState() => _ScreenCanvasState();
}

class _ScreenCanvasState extends State<ScreenCanvas> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteBloc, NoteBlocState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                context.read<NoteBloc>().add(SaveNoteChanges());
                context.read<NoteBloc>().add(ChangeEditMode());
                Navigator.pop(context);
              },
              icon: const Icon(IconsaxOutline.arrow_left_2),
            ),
            title: state.isEditing
                ? TextField(
                    controller: state.noteTitleController!,
                    decoration: const InputDecoration(border: InputBorder.none),
                  )
                : Text(state.noteTitleController!.text.isEmpty
                    ? !(state.noteTextController!.text.isEmpty ||
                            state.noteTextController!.text.length < 10)
                        ? state.noteTextController!.text.substring(0, 10)
                        : state.noteTitleController!.text
                    : state.noteTitleController!.text),
            actions: [
              IconButton(
                icon: Icon(state.isEditing
                    ? IconsaxOutline.edit_2
                    : IconsaxOutline.book_1),
                onPressed: () {
                  context.read<NoteBloc>().add(SaveNoteChanges());

                  context.read<NoteBloc>().add(ChangeEditMode());
                },
              ),
            ],
          ),
          body: state.isEditing ? const EditMode() : const PreviewMode(),
        );
      },
    );
  }
}
