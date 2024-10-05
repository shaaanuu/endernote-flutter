import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'bloc/notes/note_bloc.dart';
import 'models/note_model.dart';
import 'presentation/screens/about/screen_about.dart';
import 'presentation/screens/canvas/screen_canvas.dart';
import 'presentation/screens/hero/screen_hero.dart';
import 'presentation/screens/home/screen_home.dart';
import 'presentation/screens/settings/screen_settings.dart';
import 'presentation/theme/endernote_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  String dirPath;

  if (Platform.isAndroid || Platform.isIOS) {
    final dir = await getApplicationDocumentsDirectory();
    dirPath = dir.path;
  } else {
    final dir = await getApplicationSupportDirectory();
    dirPath = dir.path;
  }

  final isar = await Isar.open([NoteModelSchema], directory: dirPath);

  runApp(MyApp(isar: isar));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isar});

  final Isar isar;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (context) => NoteBloc(isar: isar),
        ),
      ],
      child: MaterialApp(
        title: 'Endernote',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/canvas': (context) => ScreenCanvas(),
          '/home': (context) => const ScreenHome(),
          '/settings': (context) => const ScreenSettings(),
          '/about': (context) => const ScreenAbout(),
        },
        theme: enderNoteTheme,
        home: const ScreenHero(),
      ),
    );
  }
}
