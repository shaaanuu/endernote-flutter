import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';

import 'edit_mode/edit_mode.dart';
import 'preview_mode/preview_mode.dart';

class ScreenCanvas extends StatelessWidget {
  const ScreenCanvas({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier editOrPreview = ValueNotifier<bool>(false);

    return ValueListenableBuilder(
      valueListenable: editOrPreview,
      builder: (context, value, _) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(IconsaxOutline.arrow_left_2),
          ),
          actions: [
            IconButton(
              icon: Icon(value ? IconsaxOutline.edit_2 : IconsaxOutline.book_1),
              onPressed: () {
                editOrPreview.value = !editOrPreview.value;
              },
            ),
          ],
        ),
        body: value ? const PreviewMode() : const EditMode(),
      ),
    );
  }
}
