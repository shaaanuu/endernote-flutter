import 'package:flutter/material.dart';

class ScreenHero extends StatelessWidget {
  const ScreenHero({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu_rounded),
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
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Placeholder(
                fallbackHeight: 150,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              child: const Text('Create new note'),
              onPressed: () {},
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
          backgroundColor: WidgetStatePropertyAll(Color(0xFFcdd6f4)),
        ),
        icon: const Icon(
          Icons.add,
          color: Color(0xFF1e1e2e),
        ),
        onPressed: () {},
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
