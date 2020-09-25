import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notesandflame/widgets/note_list_widget.dart';
import 'note_model.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final db = Firestore.instance;
  db.settings(timestampsInSnapshotsEnabled: true, persistenceEnabled: false);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final noteModel = NoteModel();
    return ScopedModel(
        model: noteModel,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Memories',
          theme: ThemeData(
            primaryColor: Color.fromRGBO(155, 68, 152, 1.0),
          ),
          home: NoteListWidget(title: 'Firenotes'),
        ));
  }
}
