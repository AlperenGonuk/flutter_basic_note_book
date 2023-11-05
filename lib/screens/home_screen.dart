import 'package:flutter/material.dart';
import 'package:flutter_notes/models/note_model.dart';
import 'package:flutter_notes/screens/create_note.dart';
import 'package:flutter_notes/screens/note_view.dart';
import 'package:flutter_notes/screens/screen_items.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String homeTitle = 'Flutter Notes';
  List<Note> notes = List.empty(growable: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: ScreenAppBarTitle(Title: homeTitle)),
      ),
      body: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            return _noteCardWiget(
              onNoteDeleted: onNoteDeleted,
              notes: notes,
              index: index,
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  CrateNoteScreen(onNewNoteCreated: onNewNoteCreated)));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void onNewNoteCreated(Note note) {
    notes.add(note);
    setState(() {});
  }

  void onNoteDeleted(int index) {
    notes.removeAt(index);
    setState(() {});
  }
}

class _noteCardWiget extends StatelessWidget {
  const _noteCardWiget(
      {required this.index,
      super.key,
      required this.notes,
      required this.onNoteDeleted});

  final List<Note> notes;
  final int index;
  final Function(int) onNoteDeleted;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => NoteView(
                  index: index,
                  note: notes[index],
                  onNoteDeleted: onNoteDeleted,
                )));
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                notes[index].title,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              Text(
                notes[index].body,
                style: const TextStyle(fontSize: 20),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
