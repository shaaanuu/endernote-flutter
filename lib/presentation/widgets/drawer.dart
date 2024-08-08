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

Widget showDrawer(context) {
  return Drawer(
    width: 250,
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        // const DrawerHeader(
        //   child: Text('Header'),
        // ),
        const SizedBox(
          height: 50,
        ),
        _tiles(
          icn: Icons.settings,
          title: 'Settings',
          onTap: () {},
        ),
        _tiles(
          icn: Icons.access_alarm,
          title: 'title',
        ),
        _tiles(
          icn: Icons.accessible_outlined,
          title: 'title',
        ),
        _tiles(
          icn: Icons.zoom_in_map_sharp,
          title: 'title',
        ),
        _tiles(
          icn: Icons.catching_pokemon,
          title: 'title',
        ),
      ],
    ),
  );
}
