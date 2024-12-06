import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';

class ScreenSettings extends StatelessWidget {
  const ScreenSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(IconsaxOutline.arrow_left_2),
        ),
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(IconsaxOutline.brush_3),
              title: const Text('Theme'),
              subtitle: const Text('Catppuccin Mocha'),
              onTap: () => showModalBottomSheet(
                context: context,
                builder: (context) => Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: ListView(
                    children: [
                      const SizedBox(height: 20),
                      ListTile(
                        title: const Text('Catppuccin Mocha'),
                        onTap: () {
                          Navigator.pop(context);

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Color(0xFF181825),
                              content: Text(
                                'Selected theme: Catppuccin Mocha.',
                                style: TextStyle(color: Color(0xFFbac2de)),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Divider(),
            const ListTile(
              leading: Icon(IconsaxOutline.direct_normal),
              title: Text('demo'),
              subtitle: Text('demo'),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
