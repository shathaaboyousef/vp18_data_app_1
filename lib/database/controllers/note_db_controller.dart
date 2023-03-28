import 'package:vp18_data_app_1/database/db_operations.dart';
import 'package:vp18_data_app_1/models/note.dart';
import 'package:vp18_data_app_1/pref/shared_preferences_controller.dart';
class NoteDbController extends DbOperations<Note>{
  NoteDbController._();
  static NoteDbController? _instance;
  int userId= SharedPrefController().getValues(PrefKeys.id.name)!;
  factory NoteDbController(){
    return _instance??=NoteDbController._();
  }

  @override
  Future<int> create(Note model) async{
    // return database.rawInsert("INSERT INTO notes (title, info, user_id) VALUE (? , ? , ?)",
    //     [model.title, model.info ,model.userId]);
    return database.insert(Note.tableName, model.toMap());
  }

  @override
  Future<bool> delete(int id) async {
   // int countOfDeletedRows = await database.rawDelete("DELETE FROM notes WHERE id = ?",[id]);
    int countOfDeletedRows = await database.delete(Note.tableName,where: 'id = ? AND user_id =?',whereArgs: [id,userId]);
   return countOfDeletedRows ==1;
  }

  @override
  Future<List<Note>> read() async {
   // List<Map<String,dynamic>> rows = await database.rawQuery("SELECT * FROM notes");
    List<Map<String,dynamic>> rows = await database.query(Note.tableName,where:'user_id = ?',whereArgs:[userId]);
   return rows.map((rowMap) => Note.fromMap(rowMap)).toList();
  }

  @override
  Future<Note?> show(int id) async{
    // List<Map<String,dynamic>> rows = await database.rawQuery("SELECT * FROM notes WHERE id = ? ", [id]);
    List<Map<String,dynamic>> rows = await database.query(Note.tableName,where: 'id = ?',whereArgs: [id]);
    return rows.isNotEmpty ? Note.fromMap(rows.first): null;
  }

  @override
  Future<bool> update(Note model) async{
    // int countOfUpdatedRow= await database.rawUpdate("UPDATE notes SET title = ? , info = ? , user_id=?" WHERE id = ?,
    //     [model.title,model.info,model.userId , model.id]);
    int countOfUpdatedRow= await database.update(Note.tableName, model.toMap(),where: 'id = ? AND userId = ?',whereArgs: [model.id, userId]);
    return countOfUpdatedRow ==1;
  }

  /**
   * CRUD
   *
   *  (C) => CREATE => INSERT
   *  (R) =>READ => SELECT
   *  (U) UPDATE => UPDATE
   *  (D)=>DELETE => DELETE
   *
   */


}