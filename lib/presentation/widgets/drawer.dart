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

Widget showDrawer(BuildContext context) {
  return Drawer(
    width: 250,
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          child: Column(
            children: [
              GestureDetector(
                child: const CircleAvatar(radius: 50),
                onTap: () => Navigator.pushNamed(context, '/sign_in'),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'John Doe',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        _tiles(
          icn: IconsaxOutline.folder,
          title: 'All Notes',
          onTap: () => Navigator.pushNamed(context, '/home'),
        ),
        _tiles(
          icn: IconsaxOutline.heart,
          title: 'Favourite',
          onTap: () => Navigator.pushNamed(context, '/favourite'),
        ),
        _tiles(
          icn: IconsaxOutline.setting_2,
          title: 'Settings',
          onTap: () => Navigator.pushNamed(context, '/settings'),
        ),
        _tiles(
          icn: IconsaxOutline.book_1,
          title: 'Guide',
          onTap: () => Navigator.pushNamed(context, '/guide'),
        ),
        _tiles(
          icn: IconsaxOutline.book,
          title: 'About',
          onTap: () => Navigator.pushNamed(context, '/about'),
        ),
        _tiles(
          icn: IconsaxOutline.user,
          title: 'Sign in',
          onTap: () => Navigator.pushNamed(context, '/sign_in'),
        ),
        _tiles(
          icn: IconsaxOutline.user_add,
          title: 'Sign up',
          onTap: () => Navigator.pushNamed(context, '/sign_up'),
        ),
      ],
    ),
  );
}
