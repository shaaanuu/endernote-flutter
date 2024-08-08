import 'package:endernote_flutter/presentation/screens/canvas/edit_mode/edit_mode.dart';
import 'package:endernote_flutter/presentation/screens/canvas/preview_mode/preview_mode.dart';
import 'package:flutter/material.dart';

class ScreenCanvas extends StatelessWidget {
  const ScreenCanvas({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier editOrPreview = ValueNotifier<bool>(false);

    return ValueListenableBuilder(
      valueListenable: editOrPreview,
      builder: (context, value, _) => Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(value ? Icons.edit : Icons.preview),
              onPressed: () {
                editOrPreview.value = !editOrPreview.value;
              },
            ),
          ],
        ),
        body: value ? PreviewMode() : EditMode(),
      ),
    );
  }
}
