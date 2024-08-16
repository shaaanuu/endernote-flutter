import 'package:endernote_flutter/presentation/screens/home/screen_home.dart';
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
        '/home': (context) => const ScreenHome(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: clrBase,
        appBarTheme: const AppBarTheme(
          scrolledUnderElevation: 0,
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
      h1: const TextStyle(
        color: Color(0xFFcdd6f4),
        fontWeight: FontWeight.bold,
      ),
      h2: const TextStyle(
        color: Color(0xFFcdd6f4),
        fontWeight: FontWeight.bold,
      ),
      h3: const TextStyle(
        color: Color(0xFFcdd6f4),
        fontWeight: FontWeight.bold,
      ),
      h4: const TextStyle(
        color: Color(0xFFcdd6f4),
        fontWeight: FontWeight.bold,
      ),
      h5: const TextStyle(
        color: Color(0xFFcdd6f4),
        fontWeight: FontWeight.bold,
      ),
      h6: const TextStyle(
        color: Color(0xFFcdd6f4),
        fontWeight: FontWeight.bold,
      ),
      p: const TextStyle(
        color: Color(0xFFbac2de),
      ),
      codeblockDecoration: BoxDecoration(
        color: const Color(0xFF11111b),
        borderRadius: BorderRadius.circular(5),
      ),
      code: const TextStyle(
        color: Color(0xFFbac2de),
        backgroundColor: Color(0xFF11111b),
      ),
      blockquoteDecoration: BoxDecoration(
        color: const Color(0xFF11111b),
        borderRadius: BorderRadius.circular(10),
      ),
      horizontalRuleDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: const Border(
          top: BorderSide(
            width: 5.0,
            color: Color(0xFFb4befe),
          ),
        ),
      ),
      a: const TextStyle(color: Color(0xFF89b4fa)),
    );
