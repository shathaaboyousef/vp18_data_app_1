import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';
enum PrefKeys {loggedIn ,id, fullName , email, language}
class SharedPrefController {
  late SharedPreferences _sharedPreferences;
  static SharedPrefController? _instance;
  // لو بدي استخدمها في ال factory constractor
  // static لازم يكون

  SharedPrefController._();
  factory SharedPrefController() {
    return _instance ??= SharedPrefController._(); // معناها لو موجود استعديه لو مش موجود انشأه
  }
  Future<void> initPreferences() async{
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> save(User user) async{
   await  _sharedPreferences.setBool(PrefKeys.loggedIn.name, true);
   await  _sharedPreferences.setInt(PrefKeys.id.name, user.id);
    await _sharedPreferences.setString(PrefKeys.fullName.name, user.fullName);
   await  _sharedPreferences.setString(PrefKeys.email.name, user.email);
  }

  bool get loggedIn => _sharedPreferences.getBool(PrefKeys.loggedIn.name) ?? false;

  T? getValues<T>(String key){
    if(_sharedPreferences.containsKey(key)){
      return _sharedPreferences.get(key) as T;
    }
    return null ;
  }

  Future<void> setValue<T>(String key , T value) async{
    if( T == String ){
    _sharedPreferences.setString(key, value as String);
    } if( T == bool ){
      await  _sharedPreferences.setBool(key, value as bool);
    } if( T == double ){
      await  _sharedPreferences.setDouble(key, value as double);
    } if( T == int ){
      await  _sharedPreferences.setInt(key, value as int);
    }
  }

  Future<bool> removeValueFor(String key ) async{
    if(_sharedPreferences.containsKey(key))
      {
        return _sharedPreferences.remove(key);
      }
    return false ;
  }

  Future<bool> clear(){
    return _sharedPreferences.clear();
  }
}
