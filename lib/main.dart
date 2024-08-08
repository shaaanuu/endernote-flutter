import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import 'presentation/screens/canvas/screen_canvas.dart';
import 'presentation/screens/hero/screen_hero.dart';
import 'presentation/widgets/konstants.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: clrBase,
        appBarTheme: const AppBarTheme(
          backgroundColor: clrBase,
          foregroundColor: clrText,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: clrText),
          // headlineSmall: TextStyle(color: clrText),
          // titleMedium: TextStyle(color: clrText),
          // titleLarge: TextStyle(color: clrText),
          bodyLarge: TextStyle(color: clrText), // Text Input form
        ),
        iconButtonTheme: const IconButtonThemeData(
          style: ButtonStyle(
            iconColor: WidgetStatePropertyAll(clrText),
            fixedSize: WidgetStatePropertyAll(Size(50, 50)),
          ),
        ),
        textButtonTheme: const TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: WidgetStatePropertyAll(clrText),
          ),
        ),
        drawerTheme: const DrawerThemeData(
          backgroundColor: clrBase,
        ),
        listTileTheme: const ListTileThemeData(
          iconColor: clrText,
          textColor: clrText,
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: clrBase,
        ),
      ),
      home: const ScreenHero(),
    );
  }
}

MarkdownStyleSheet mdTheme() => MarkdownStyleSheet(
      h1: const TextStyle(color: Colors.red),
      h2: const TextStyle(color: Colors.red),
      h3: const TextStyle(color: Colors.red),
      h4: const TextStyle(color: Colors.red),
      h5: const TextStyle(color: Colors.red),
      h6: const TextStyle(color: Colors.red),
      codeblockDecoration: const BoxDecoration(
        color: Colors.black38,
      ),
      code: const TextStyle(
        backgroundColor: Colors.transparent,
      ),
      blockquoteDecoration: const BoxDecoration(
        color: Colors.black38,
      ),
    );
