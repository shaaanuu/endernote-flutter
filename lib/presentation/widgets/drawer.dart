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
          icn: IconsaxOutline.setting_2,
          title: 'Settings',
          onTap: () {},
        ),
        _tiles(
          icn: IconsaxOutline.activity,
          title: 'title',
        ),
        _tiles(
          icn: IconsaxOutline.activity,
          title: 'title',
        ),
        _tiles(
          icn: IconsaxOutline.activity,
          title: 'title',
        ),
        _tiles(
          icn: IconsaxOutline.activity,
          title: 'title',
        ),
      ],
    ),
  );
}
