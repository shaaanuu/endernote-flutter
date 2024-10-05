import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';

class ScreenAbout extends StatelessWidget {
  const ScreenAbout({super.key});

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
        title: const Text('About'),
      ),
      body: const Center(
        child: Text("Screen About"),
      ),
    );
  }
}
