import 'package:flutter/material.dart';
import 'package:note_keeper/screens/note_detail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NoteList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NoteListState();
  }
}

class NoteListState extends State<NoteList> {
  var count = 0;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keep Your notes'),
      ),

      body: getNoteListView(),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // NavigateTodetail('Add Note');
          _showInputDialog(context);
          // Navigator.push(context, MaterialPageRoute(builder: (context) {
          //   return NoteDetail();
          // }));
        },
        tooltip: 'Add Note',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  ListView getNoteListView() {
    TextStyle? titlestyle = Theme
        .of(context)
        .textTheme
        .headline6;

    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            color: Colors.white,
            child: ListTile(

              leading: CircleAvatar(
                backgroundColor: Colors.yellow,
                child: Icon(Icons.keyboard_arrow_right),
              ),

              title: Text(
                'Demo title',
                style: titlestyle,
              ),
              subtitle: Text('Demo date'),

              onTap: () {
                NavigateTodetail('Edit Notes');
              },
            ),
          );
        });
  }
  void NavigateTodetail(String title){
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NoteDetail(title);
    }));

  }

  void _showInputDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add a New Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Handle the data entered by the user
                String title = _titleController.text;
                String description = _descriptionController.text;

                // Do something with the data, e.g., save it to a list
                // Here, we'll just print it
                print('Title: $title');
                print('Description: $description');

                // Clear the text fields
                _titleController.clear();
                _descriptionController.clear();

                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

}
