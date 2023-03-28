import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vp18_data_app_1/database/controllers/user_db_controller.dart';
import 'package:vp18_data_app_1/models/process_responce.dart';
import 'package:vp18_data_app_1/models/user.dart';
import 'package:vp18_data_app_1/pref/shared_preferences_controller.dart';
import 'package:vp18_data_app_1/providers/language_provider.dart';
import 'package:vp18_data_app_1/utils/context_extentions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController _emailController;
  late TextEditingController _fullNameController;
  late TextEditingController _passwordController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController = TextEditingController();
    _fullNameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(context.localizations.sign_in),

      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                context.localizations.register_hint,
                style: GoogleFonts.tajawal(
                    fontSize: 26, fontWeight: FontWeight.bold),
              ),
              Text(
                context.localizations.register_massage,
                style: GoogleFonts.tajawal(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: _fullNameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: context.localizations.full_name,
                  labelStyle: GoogleFonts.tajawal(fontSize: 20),
                  hintStyle: GoogleFonts.tajawal(fontSize: 16),
                  prefixIcon: const Icon(Icons.person),
                  hintText:context.localizations.full_name,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: context.localizations.email,
                  labelStyle: GoogleFonts.tajawal(fontSize: 20),
                  hintStyle: GoogleFonts.tajawal(fontSize: 16),
                  prefixIcon: const Icon(Icons.email),
                  hintText:context.localizations.email_hint,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                obscureText: _obscureText,
                controller: _passwordController,
                keyboardType: TextInputType.visiblePassword,
                onTap: () => setState(() {
                  _obscureText != _obscureText;
                }),
                decoration: InputDecoration(
                  labelText: context.localizations.password,
                  labelStyle: GoogleFonts.tajawal(fontSize: 20),
                  hintStyle: GoogleFonts.tajawal(fontSize: 16),
                  prefixIcon: const Icon(Icons.lock),
                  hintText: context.localizations.password_hint,
                  suffixIcon: _obscureText
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () => _performRegister(),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  primary: Colors.blue.shade400,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(context.localizations.sign_in),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(context.localizations.have_an_account ,style: TextStyle(fontSize: 15),),
                  TextButton(onPressed: (){
                    Navigator.pushReplacementNamed(context, '/login_screen');
                  }, child: Text(context.localizations.login,),),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _performRegister() {
    if (_checkData()) _regester();
  }

  bool _checkData() {
    if (_emailController.text.isNotEmpty &&
        _fullNameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      return true;
    }
    context.showSnackBar(massage: "Enter required data ", error: true);
    return false;
  }

  void _regester() async{
    ProcessResponse processResponse = await UserDbController().register(user);
    context.showSnackBar(massage: processResponse.massage , error :!processResponse.success);
    if(processResponse.success) {
      Navigator.pushReplacementNamed(context, '/login_screen');
    }
  }

  User get user{
    User user =User();
    user.fullName = _fullNameController.text;
    user.email = _emailController.text;
    user.password = _passwordController.text;
    return user;
  }

}
