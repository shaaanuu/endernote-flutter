import 'package:flutter/material.dart';

class EditMode extends StatelessWidget {
  const EditMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // color: Colors.red.withOpacity(0.1),
        child: TextFormField(
          
          // controller: cntrl,
          expands: true,
          minLines: null,
          maxLines: null,
        ),
      ),
    );
  }
}
