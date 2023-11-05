import 'package:flutter/material.dart';
import 'package:flutter_notes/models/note_model.dart';
import 'package:flutter_notes/screens/screen_items.dart';

class NoteView extends StatelessWidget {
  const NoteView(
      {required this.index,
      required this.note,
      super.key,
      required this.onNoteDeleted});
  final Note note;
  final int index;
  final String AppBarTitle = 'Note View';
  final Function(int) onNoteDeleted;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: ScreenAppBarTitle(Title: AppBarTitle)),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Delete This ?'),
                        content: Text('Title ${note.title} Will Be Delete!'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                onNoteDeleted(index);
                                Navigator.of(context).pop();
                              },
                              child: const Text('Delete')),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('CANCEL')),
                        ],
                      );
                    });
              },
              icon: const Icon(Icons.delete))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              note.title,
              style: const TextStyle(fontSize: 26),
            ),
            SizedBox(height: 10),
            Text(
              note.body,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
