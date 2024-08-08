import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';

ListTile _tiles({
  required final IconData icn,
  required final String title,
  final void Function()? onTap,
}) {
  return ListTile(
    leading: Icon(
      icn,
    ),
    title: Text(
      title,
    ),
    onTap: onTap ?? () {},
  );
}

void bottomSheet(context) => showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        height: 120,
        alignment: Alignment.center,
        child: ListView(
          children: [
            const SizedBox(height: 20),
            _tiles(
              icn: IconsaxOutline.note_favorite,
              title: 'Open today\'s daily note',
              onTap: () => Navigator.pushNamed(context, '/canvas'),
            ),
            _tiles(
              icn: IconsaxOutline.note_add,
              title: 'Create a new note',
              onTap: () => Navigator.pushNamed(context, '/canvas'),
            ),
          ],
        ),
      ),
    );
