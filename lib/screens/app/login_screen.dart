import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vp18_data_app_1/database/controllers/user_db_controller.dart';
import 'package:vp18_data_app_1/models/process_responce.dart';
import 'package:vp18_data_app_1/pref/shared_preferences_controller.dart';
import 'package:vp18_data_app_1/providers/language_provider.dart';
import 'package:vp18_data_app_1/utils/context_extentions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  String? _language ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController = TextEditingController();
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
        title:  Text(context.localizations.login),
        actions: [
          IconButton(
            onPressed: () {
              _showLanguageBottomSheet();
            },
            icon: Icon(
              Icons.language,
            ),
          ),
        ],
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
                context.localizations.login_hint,
                style: GoogleFonts.tajawal(
                    fontSize: 26, fontWeight: FontWeight.bold),
              ),
              Text(
                context.localizations.login_massage,
                style: GoogleFonts.tajawal(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 30,
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
                onPressed: () => _performLogin(),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  primary: Colors.blue.shade400,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(context.localizations.login),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(context.localizations.no_account ,style: TextStyle(fontSize: 15),),
                  TextButton(onPressed: (){
                    Navigator.pushReplacementNamed(context, '/register_screen');
                  }, child: Text(context.localizations.sign_in,),),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _performLogin() {
    if (_checkData()) _login();
  }

  bool _checkData() {
    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      return true;
    }
    context.showSnackBar(massage: "Enter required data ", error: true);
    return false;
  }

  void _login() async{
    ProcessResponse processResponse = await UserDbController().login(_emailController.text, _passwordController.text);
    context.showSnackBar(massage: processResponse.massage , error :!processResponse.success);
    if(processResponse.success) {
      Navigator.pushReplacementNamed(context, '/home_screen');
    }
  }

  void _showLanguageBottomSheet()async {
   String ? result = await showModalBottomSheet<String>( // nullable   عشان بحالة ال Dismissible  حيعطي null
      // isDismissible: false,
      context: context,
      // backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder( //  shape او بغير لون وحدة منهم ل شفاف يا بعمل للتنين
        borderRadius: BorderRadius.circular(10),
      ),
      builder: (context) {
        return BottomSheet(
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(10),
          // ),
          backgroundColor: Colors.transparent,
          onClosing: () {},
          builder: (context) {
            return StatefulBuilder(builder: (context, setState) => Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    context.localizations.language_hint,
                    style: GoogleFonts.tajawal(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.black),
                  ),
                  Text(
                    context.localizations.language_massage,
                    style: GoogleFonts.tajawal(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Colors.black),
                  ),
                  RadioListTile<String>(
                    title:  const Text('العربية '),
                    contentPadding: EdgeInsetsDirectional.zero,
                    visualDensity: VisualDensity(
                      vertical:VisualDensity.minimumDensity,
                    ),
                    value: 'ar',
                    groupValue: _language,
                    onChanged: (String? value) {
                      setState(() {
                        _language = value;
                        Navigator.pop(context,'ar');
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: const Text("English"),
                    contentPadding: EdgeInsetsDirectional.zero,
                    visualDensity: VisualDensity(
                      vertical:VisualDensity.minimumDensity,
                    ),
                    value: 'en',
                    groupValue: _language,
                    onChanged: (String? value) {
                      setState(() {
                      _language = value;
                      Navigator.pop(context,'en');

                      });
                    },
                  ),
                ],
              ),
            ),);
          },
        );
      },
    );
   if(result != null) // يعني ضغط عليها وما عمل dismissible
     {
       // TODO:change the language
     Provider.of<LanguageProvider>(context ,listen: false).changeLanguage(result);
     }
  }
}
