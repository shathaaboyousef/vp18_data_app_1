import 'package:flutter/material.dart';
import 'package:vp18_data_app_1/pref/shared_preferences_controller.dart';

class LanguageProvider extends ChangeNotifier{
   String language = SharedPrefController().getValues<String>(PrefKeys.language.name) ??'en' ;
    void changeLanguage(String language) {
      this.language = language;
      SharedPrefController().setValue<String>( PrefKeys.language.name, language);
      notifyListeners();
    }

}