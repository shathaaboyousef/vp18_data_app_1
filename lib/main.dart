import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vp18_data_app_1/database/db_controller.dart';
import 'package:vp18_data_app_1/pref/shared_preferences_controller.dart';
import 'package:vp18_data_app_1/providers/note_provider.dart';
import 'package:vp18_data_app_1/screens/app/home_screen.dart';
import 'package:vp18_data_app_1/screens/app/login_screen.dart';
import 'package:vp18_data_app_1/screens/app/register_screen.dart';
import 'package:vp18_data_app_1/screens/code/lunch_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


import 'providers/language_provider.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initPreferences();
  await DbController().initDatabase();
  runApp(const MyApp());}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override

  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<LanguageProvider>(create : (context) => LanguageProvider()),
      ChangeNotifierProvider<NoteProvider>(create : (context) => NoteProvider(),),],
      builder:(context, child) {
       return MaterialApp(
        theme: ThemeData(

          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(

            backgroundColor: Colors.white,
             titleTextStyle: GoogleFonts.tajawal(
               fontWeight: FontWeight.bold,
                 fontSize :28,

                 color: Colors.black),
            elevation: 0,
            centerTitle: true,
            iconTheme: IconThemeData(color: Colors.black,),

          )
        ),
        // localizationsDelegates:   [
        //   AppLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate,
        //  GlobalMaterialLocalizations.delegate,
        //   GlobalCupertinoLocalizations.delegate,
        // ],
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        locale: Locale(Provider.of<LanguageProvider>(context,listen: true).language),
        // supportedLocales: const[
        //   Locale('ar'),
        //   Locale('en'),
        // ],
supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: false,
        initialRoute: '/launch_screen',
        routes: {
          '/launch_screen' : (context) => const LaunchScreen(),
          '/login_screen' : (context) => const LoginScreen(),
          '/register_screen' : (context) => const RegisterScreen(),
          '/home_screen' : (context) => const HomeScreen(),
        },

      );
      },
    );
  }
}
