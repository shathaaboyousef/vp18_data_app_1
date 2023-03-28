import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:vp18_data_app_1/pref/shared_preferences_controller.dart';
import 'package:vp18_data_app_1/providers/note_provider.dart';
import 'package:vp18_data_app_1/screens/app/note_screen.dart';
import 'package:vp18_data_app_1/utils/context_extentions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<NoteProvider>(context,listen: false).read();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home "),
        actions: [
          IconButton(
            onPressed: () {
              _showLogoutConfirmationDialog();
            },
            icon: Icon(
              Icons.logout,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NoteScreen(),
                ),
              );
            },
            icon: Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: Consumer<NoteProvider>(
        builder: (context,  value, child) {
          if(value.notes.isNotEmpty){
            return ListView.builder(
              itemCount: value.notes.length,
              itemBuilder: (context, index) => ListTile(
                leading: Icon(
                  Icons.note,
                ),
                title: Text(
                  value.notes[index].title,
                ),
                subtitle: Text(
                    value.notes[index].info,
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              ),
            );
          }
          else{
           return Center(
              child: Text("No Notes"),
            );
          }
        },
      ),
    );
  }

  void _showLogoutConfirmationDialog() async {
    bool? result = await showDialog(
      // barrierDismissible: false,
      // barrierColor: Colors.red.shade200,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(context.localizations.confirm_hint),
          content: Text(context.localizations.confirm_massage),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Text(
                context.localizations.yes,
                style: GoogleFonts.tajawal(
                    fontSize: 14,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: Text(
                context.localizations.no,
                style: GoogleFonts.tajawal(
                    fontSize: 14,
                    // color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        );
      },
    );
    if (result ?? false) {
      // logged out code
      // await  SharedPrefController().removeValueFor(PrefKeys.loggedIn.name);
      SharedPrefController().setValue(PrefKeys.loggedIn.name, false);
      Future.delayed(const Duration(microseconds: 500), () {
        Navigator.pushReplacementNamed(context, '/login_screen');
      });
    }
  }
}
