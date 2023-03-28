import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbController{
  DbController._();

  late Database _database;

  static DbController ? _instance;

  Database  get database => _database;


  factory DbController(){
     return _instance ??=DbController._();
  }
  Future<void> initDatabase() async{
    Directory directory =await getApplicationDocumentsDirectory(); //هاي حصلنا عليها من مكتبة path_provider بتحدد المسار حسب بيئة العمل
    String path = join(directory.path,'app_db.sql');
    _database = await openDatabase(
      path,
      version: 1,
      onOpen: ( Database  db) {
        db.execute("CREATE TABLE users ("
        "id INTEGER PRIMARY KEY AUTOINCREMENT,"
        "full_name TEXT,"
        "email TEXT,"
        "password TEXT"
        ")");
        db.execute("CREATE TABLE notes ("
            "id INTEGER PRIMARY KEY AUTOINCREMENT,"
            "title TEXT,"
            "info TEXT,"
            "user_id INTEGER,"
            "FOREIGN KEY (user_id) references users(id)"
            ")");
      },
      onCreate: ( Database db,  int version) {} ,
      onUpgrade: ( Database db, int  oldVersion,  int newVersion) {},
      onDowngrade: ( Database db,  int oldVersion, int  newVersion) {},
    );
  }
}