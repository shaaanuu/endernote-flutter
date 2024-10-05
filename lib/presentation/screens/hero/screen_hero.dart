import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ficonsax/ficonsax.dart';

import '../../../bloc/notes/note_bloc.dart';
import '../../../bloc/notes/note_events.dart';
import '../../theme/endernote_theme.dart';
import '../../widgets/bottom_sheet.dart';
import '../../widgets/drawer.dart';

class ScreenHero extends StatelessWidget {
  const ScreenHero({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      drawer: showDrawer(context),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(IconsaxOutline.menu_1),
          onPressed: () {
            scaffoldKey.currentState!.openDrawer();
          },
        ),
        title: const Text('Endernote'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Craft your second brain',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: SvgPicture.asset(
                "lib/assets/brain.svg",
                height: 150,
                color: clrText,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              child: const Text('Create new note'),
              onPressed: () {
                context.read<NoteBloc>().add(CreateNote());

                Navigator.pushNamed(context, '/canvas');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              child: const Text('Open a note'),
              onPressed: () => Navigator.pushNamed(context, '/home'),
            ),
          ),
        ],
      ),
      floatingActionButton: IconButton.filled(
        style: const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(clrText),
        ),
        icon: const Icon(
          IconsaxOutline.add,
          color: clrBase,
        ),
        onPressed: () => showCustomBottomSheet(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(IconsaxOutline.note_2),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(IconsaxOutline.note_1),
            ),
          ],
        ),
      ),
    );
  }
}
