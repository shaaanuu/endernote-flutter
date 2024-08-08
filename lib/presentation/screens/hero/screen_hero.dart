import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../widgets/bottom_sheet.dart';
import '../../widgets/drawer.dart';
import '../../widgets/konstants.dart';

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
          icon: const Icon(Icons.menu_rounded),
          onPressed: () {
            scaffoldKey.currentState!.openDrawer();
          },
        ),
        title: const Text(
          'Endernote',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
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
                Navigator.pushNamed(context, '/canvas');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              child: const Text('Open a note'),
              onPressed: () {},
            ),
          ),
        ],
      ),
      floatingActionButton: IconButton.filled(
        style: const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(clrText),
        ),
        icon: const Icon(
          Icons.add,
          color: clrBase,
        ),
        onPressed: () => bottomSheet(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.format_list_bulleted_rounded),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.apps_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
