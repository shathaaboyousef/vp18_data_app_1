import 'package:sqflite/sqflite.dart';
import 'package:vp18_data_app_1/database/db_controller.dart';

abstract class DbOperations<Model>{

  Future<int> create( Model model);
  Database database = DbController().database;

  Future<List<Model>> read();
  Future<Model?> show(int id);
  Future<bool> update(Model model);
  Future<bool> delete(int id);
}