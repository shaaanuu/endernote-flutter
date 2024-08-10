import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        child: Shortcuts(
          shortcuts: <LogicalKeySet, Intent>{
            LogicalKeySet(LogicalKeyboardKey.tab): const IndentIntent(),
          },
          child: Actions(
            actions: <Type, Action<Intent>>{
              IndentIntent: CallbackAction<IndentIntent>(
                onInvoke: (IndentIntent intent) {
                  final int cursorPosition = textControl.selection.baseOffset;
                  textControl.text =
                      '${textControl.text.substring(0, cursorPosition)}  ${textControl.text.substring(cursorPosition)}';
                  textControl.selection = TextSelection.fromPosition(
                      TextPosition(offset: cursorPosition + 2)); 
                  return null;
                },
              ),
            },
            child: TextFormField(
              controller: textControl,
              expands: true,
              minLines: null,
              maxLines: null,
            ),
          ),
        ),
      ),
    );
  }
}

class IndentIntent extends Intent {
  const IndentIntent();
}
