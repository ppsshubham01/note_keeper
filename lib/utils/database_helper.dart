import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:note_keeper/models/notes.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper; //Singleton DatabaseHelper
  static Database? _database;  //Singleton Database

  String noteTable ='note_table';
  String colId ='id';
  String colTitle ='title';
  String colDescription ='description';
  String colPriority ='priority';
  String colDate ='date';


  DatabaseHelper._createInstance(); // Named Constructor to create  instance of DatabaseHelper


  factory DatabaseHelper() {
    // _databaseHelper ??= DatabaseHelper._createInstance();
    if (_databaseHelper == null) {
      _databaseHelper=DatabaseHelper._createInstance();  // This is executed only once,singleton object

    }
    return _databaseHelper!;
  }

  Future<Database?> get database async {

    // _database ??= await initializeDatabase();
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async{
    // Get the directory path for both Android and IOS To store database
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'notes.db';

    // Open/create the database at a given path
    var notesDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
    return notesDatabase;
  }
  void _createDb(Database db ,int newVersion) async {
    await db.execute('CREATE TABLE $noteTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, '
        '$colTitle TEXT, $colDescription TEXT, $colPriority INTEGER, $colDate TEXT)');
  }
}
