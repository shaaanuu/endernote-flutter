import 'package:flutter/material.dart';

class ScreenGuide extends StatelessWidget {
  const ScreenGuide({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guide to Markdown'),
      ),
      body: const Center(
        child: Text('Screen Guide'),
      ),
    );
  }
}
