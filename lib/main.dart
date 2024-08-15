import 'package:endernote_flutter/presentation/theme/endernote_theme.dart';
import 'package:flutter/material.dart';
import 'presentation/screens/canvas/screen_canvas.dart';
import 'presentation/screens/hero/screen_hero.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Endernote',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/canvas': (context) => const ScreenCanvas(),
      },
      theme: enderNoteTheme,
      home: const ScreenHero(),
    );
  }
}
