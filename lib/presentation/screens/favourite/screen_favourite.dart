import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

import '../../../bloc/notes/note_bloc.dart';
import '../../../bloc/notes/note_events.dart';
import '../../../bloc/notes/note_states.dart';
import '../../../models/note_model.dart';
import '../../theme/endernote_theme.dart';

class ScreenFavourite extends StatelessWidget {
  const ScreenFavourite({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<NoteBloc>().add(LoadNotes());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(IconsaxOutline.arrow_left_2),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Favourites'),
      ),
      body: BlocBuilder<NoteBloc, NoteBlocState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final favoriteNotes =
              state.notes.where((note) => note.isFavorite).toList();

          if (favoriteNotes.isEmpty) {
            return const Center(
              child: Text('No favorite notes yet.'),
            );
          }

          List<NoteModel> reversedList = favoriteNotes.reversed.toList();

          return ListView.builder(
            itemCount: reversedList.length,
            itemBuilder: (context, index) => Slidable(
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  IconButton(
                    icon: const Icon(IconsaxOutline.trash),
                    onPressed: () {
                      context.read<NoteBloc>().add(
                            DeleteNote(noteId: reversedList[index].uuid),
                          );
                    },
                  ),
                  IconButton(
                    icon: reversedList[index].isFavorite
                        ? const Icon(IconsaxBold.heart)
                        : const Icon(IconsaxOutline.heart),
                    onPressed: () {
                      context
                          .read<NoteBloc>()
                          .add(ToggleFavorite(reversedList[index]));
                    },
                  ),
                ],
              ),
              child: Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: clrText),
                ),
                child: ListTile(
                  title: Text(reversedList[index].title),
                  leading: const Icon(IconsaxOutline.note),
                  subtitle: Text(
                    "${DateFormat.jm().format(reversedList[index].creationDate)} on ${DateFormat('dd-MM-yyyy').format(reversedList[index].creationDate)}",
                  ),
                  onTap: () {
                    context.read<NoteBloc>().add(
                          ChangeNote(
                            newNote: reversedList[index],
                          ),
                        );
                    Navigator.pushNamed(context, '/canvas');
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
