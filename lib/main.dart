import 'package:flutter/material.dart';
import 'package:note_keeper/screens/NoteList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Note Keeper',
      theme: ThemeData(

        primarySwatch: Colors.deepPurple
      ),
      home: NoteList(),
    );
  }
}
