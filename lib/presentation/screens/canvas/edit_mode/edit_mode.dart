import 'package:flutter/material.dart';

import '../screen_canvas.dart';

class EditMode extends StatelessWidget {
  const EditMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(5),
        color: Colors.black12,
        child: TextFormField(
          controller: textControl,
          expands: true,
          minLines: null,
          maxLines: null,
          onChanged: (value) => print(textControl.text),
        ),
      ),
    );
  }
}
