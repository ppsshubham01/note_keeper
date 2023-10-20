import 'package:flutter/physics.dart';

class Note {
  int? _id;
  String? _title;
  String? _description;
  String? _date;
  int? _priority;

  Note(this._title, this._date, this._priority, [this._description = ""]) : _id = 0;

  Note.withId(this._id, this._title, this._description, this._date, this._priority);

  int get id => _id!.toInt();
  String get title => _title!.toString();
  String get description => _description!.toString();
  int get priority => _priority!.toInt();
  String get date => _date!.toString();

  set title(String newTitle) {
    if (newTitle.length <= 255) {
      this._title = newTitle;
    }
  }

  set priority(int newPriority) {
    if (newPriority >= 1 && newPriority <= 2) {
      this._priority = newPriority;
    }
  }

  set data(String newDate) {
    this._date = newDate;
  }

  // change a note object into a Map object
  Map<String, dynamic> toMap() {

    var map = Map<String, dynamic>();
    if(id != null) {
      map['id'] = _id; }
    map['title'] = _title;
    map['description'] = _description;
    map['priority'] = _priority;
    map['date'] = _date;

    return map;
  }
  // Extract a Note object from a Map object
  Note.fromMapObject( Map<String, dynamic> map ) {

    this._id = map['id'];
    this._title = map['title'];
    this._description = map['description'];
    this._priority = map['priority'];
    this._date = map['date'];

  }

}

