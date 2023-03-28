import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vp18_data_app_1/pref/shared_preferences_controller.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LunchScreenState();
}

class _LunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), () {

     bool loggedIn= SharedPrefController().getValues<bool>(PrefKeys.loggedIn.name) ?? false;
     String route = loggedIn ? "/home_screen":"/login_screen";
      Navigator.pushReplacementNamed(context, route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(

            gradient: LinearGradient(
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
                colors: [
          Colors.pink.shade100,
          Colors.blue.shade100,
        ])),
        child: Center(
          child: Text(
            'Data App',
            style: GoogleFonts.tajawal(color: Colors.black , fontSize: 28,fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
