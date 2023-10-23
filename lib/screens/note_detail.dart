import 'package:flutter/material.dart';
import 'package:note_keeper/models/notes.dart';
import 'package:note_keeper/utils/database_helper.dart';
import 'dart:async';
import 'package:intl/intl.dart';

class NoteDetail extends StatefulWidget {

  String appBarTitlel;

  NoteDetail(this.appBarTitlel);

  @override
  // _NoteDetailState createState() => _NoteDetailState( appBarTitlel);
  State<StatefulWidget> createState() {
    return NoteDetailState(appBarTitlel);
  }
}

class NoteDetailState  extends State<NoteDetail> {

  static var _priorities = ['High', 'Low'];
  String appBarTitle;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  NoteDetailState(this.appBarTitle);

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.titleMedium;

    return WillPopScope(
      //willPopScope wedget is for handle on your device back button to navigate a screen
      onWillPop: () {
        moveToLastScreen();
        return Future.value(false);


      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(appBarTitle),
          // Perform a pop operation on backbutton lick whih screen you want
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              moveToLastScreen();
            },

          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 15, right: 10, left: 10),
          child: ListView(
            children: <Widget>[
              ListTile(
                title: DropdownButton<String>(
                  items: _priorities.map((String dropDownStringItem) {
                    return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem));
                  }).toList(),
                  style: textStyle,
                  value: 'Low',
                  onChanged: (valueSelectedbyUse) {
                    setState(() {
                      debugPrint('user Selected');
                    });
                  },
                ),
              ),

              // Second element
              Padding(
                padding:
                    EdgeInsets.only(right: 10, left: 10, top: 15, bottom: 15),
                child: TextField(
                  controller: titleController,
                  style: textStyle,
                  onChanged: (value) {
                    debugPrint('Something chnaged in title');
                  },
                  decoration: InputDecoration(
                      labelText: 'Title',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),

              // Third element
              Padding(
                padding:
                    EdgeInsets.only(right: 10, left: 10, top: 15, bottom: 15),
                child: TextField(
                  controller: descriptionController,
                  style: textStyle,
                  onChanged: (value) {
                    debugPrint('Something chnaged in date');
                  },
                  decoration: InputDecoration(
                      labelText: 'Description',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),

              //   Forth element
              Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 15),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: ElevatedButton(
                          child: const Text('Save', textScaleFactor: 1.5,),
                          onPressed: () {
                            setState(() {
                              debugPrint('tapped on Save button');
                            });
                          },
                        )),
                    Container(width: 5.0,),
                    Expanded(
                        child: ElevatedButton(
                          child: const Text('Edit', textScaleFactor: 1.5,),
                          onPressed: () {
                            setState(() {
                              debugPrint('tapped on Edit button');
                            });
                          },
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void moveToLastScreen() {
    Navigator.pop(context);
  }
}
