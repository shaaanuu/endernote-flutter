import 'package:endernote_flutter/presentation/widgets/konstants.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(IconsaxOutline.arrow_left_2),
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: clrText),
          ),
          child: const ListTile(
            leading: Icon(IconsaxOutline.note),
            title: Text('data'),
          ),
        ),
      ),
    );
  }
}
