import 'package:endernote_flutter/presentation/screens/canvas/screen_canvas.dart';
import 'package:endernote_flutter/presentation/theme/markdown_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class PreviewMode extends StatelessWidget {
  const PreviewMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Markdown(
            data: textControl.text,
            styleSheet: mdTheme(),
          ),
        ),
      ],
    );
  }
}
