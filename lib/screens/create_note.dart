import 'package:flutter/material.dart';
import 'package:flutter_notes/models/note_model.dart';

import 'package:flutter_notes/screens/screen_items.dart';

class CrateNoteScreen extends StatefulWidget {
  const CrateNoteScreen({required this.onNewNoteCreated, super.key});
  final Function(Note) onNewNoteCreated;

  @override
  State<CrateNoteScreen> createState() => _CrateNoteScreenState();
}

class _CrateNoteScreenState extends State<CrateNoteScreen> {
  final String crateScreenTitle = 'Crate Notes';
  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ScreenAppBarTitle(Title: crateScreenTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            CrateTextFormField(
                FontSize: TitleFormItem().fontSize,
                HintText: TitleFormItem().hintText,
                controller: titleController),
            const SizedBox(height: 10),
            CrateTextFormField(
                controller: bodyController,
                FontSize: _BodyFormItem().fontSize,
                HintText: _BodyFormItem().hintText),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (titleController.text.isEmpty) {
            return;
          }
          if (bodyController.text.isEmpty) {
            return;
          }

          final note =
              Note(title: titleController.text, body: bodyController.text);
          widget.onNewNoteCreated(note);
          Navigator.of(context).pop();
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}

class TitleFormItem {
  final double fontSize = 28;
  final String hintText = 'Title';
}

class _BodyFormItem {
  final double fontSize = 14;
  final String hintText = 'Your Story';
}
