import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/notes/note_bloc.dart';
import 'presentation/screens/canvas/screen_canvas.dart';
import 'presentation/screens/hero/screen_hero.dart';
import 'presentation/screens/home/screen_home.dart';
import 'presentation/theme/endernote_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (context) => NoteBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Endernote',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/canvas': (context) => const ScreenCanvas(),
          '/home': (context) => const ScreenHome(),
        },
        theme: enderNoteTheme,
        home: const ScreenHero(),
      ),
    );
  }
}
