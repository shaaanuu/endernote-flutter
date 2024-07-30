import 'package:flutter/material.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFF1e1e2e),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1e1e2e),
          foregroundColor: Color(0xFFcdd6f4),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Color(0xFFcdd6f4)),
        ),
        iconButtonTheme: const IconButtonThemeData(
          style: ButtonStyle(
            iconColor: WidgetStatePropertyAll(Color(0xFFcdd6f4)),
            fixedSize: WidgetStatePropertyAll(Size(50, 50)),
          ),
        ),
        textButtonTheme: const TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: WidgetStatePropertyAll(Color(0xFFcdd6f4)),
          ),
        ),
      ),
      home: const ScreenHero(),
    );
  }
}
