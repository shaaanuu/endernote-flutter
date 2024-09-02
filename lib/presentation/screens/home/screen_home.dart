import 'dart:developer';

import 'package:endernote/models/note_model.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../bloc/notes/note_bloc.dart';
import '../../../bloc/notes/note_events.dart';
import '../../../bloc/notes/note_states.dart';
import '../../theme/endernote_theme.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(IconsaxOutline.arrow_left_2),
        ),
        title: const Text(
          'All Notes',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<NoteBloc, NoteBlocState>(
        builder: (context, state) {
          List<NoteModel> reversedList = state.notes.reversed.toList();
          return ListView.builder(
            itemCount: reversedList.length,
            itemBuilder: (context, index) => Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: clrText),
              ),
              child: ListTile(
                onTap: () {
                  context
                      .read<NoteBloc>()
                      .add(ChangeNote(newNote: reversedList[index]));
                  Navigator.pushNamed(context, '/canvas');
                },
                leading: const Icon(IconsaxOutline.note),
                title: Text(reversedList[index].title),
                subtitle: Text(
                  "${DateFormat.jm().format(reversedList[index].creationDate)} on ${DateFormat('dd-MM-yyyy').format(reversedList[index].creationDate)}",
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
