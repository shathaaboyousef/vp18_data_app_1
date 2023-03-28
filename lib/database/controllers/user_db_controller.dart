import 'package:sqflite/sqflite.dart';
import 'package:vp18_data_app_1/database/db_controller.dart';
import 'package:vp18_data_app_1/models/process_responce.dart';
import 'package:vp18_data_app_1/models/user.dart';
import 'package:vp18_data_app_1/pref/shared_preferences_controller.dart';

class UserDbController{

  /**
   * -Operations
   * 1) Register
   * 2) Login
   * 3)CheckIfEmailExisted
   *
   */
  Database _database = DbController().database;



  Future<ProcessResponse>login(String email , String password) async{
    List<Map<String,dynamic>> rows= await _database.query(User.tableName,where: 'email = ? AND password = ?' ,whereArgs: [email,password]);
    if(rows.isNotEmpty){
        User user= User.fromMap(rows.first);
         await SharedPrefController().save(user);
        return ProcessResponse("Logged in successfully");
    }
    return ProcessResponse('Logged in failed, try again ',false);
  }
  Future<ProcessResponse> register(User user) async{
    if(! await _checkIfEmailExisted(user.email)){
      int newRowId = await _database.insert(User.tableName, user.toMap());
      return ProcessResponse(newRowId!=0? "Registered successfully" : "Registered failed");
    }
    return ProcessResponse("Registered existed , try other email",false);
  }

  Future<bool> _checkIfEmailExisted(String email) async{
    List<Map<String,dynamic>> rows= await _database.query(User.tableName,where: 'email = ? ',whereArgs: [email],);
    return rows.isNotEmpty;
  }
}