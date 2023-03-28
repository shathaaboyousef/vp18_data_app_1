import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:vp18_data_app_1/models/note.dart';
import 'package:vp18_data_app_1/utils/context_extentions.dart';
import 'package:vp18_data_app_1/models/process_responce.dart';
import 'package:vp18_data_app_1/pref/shared_preferences_controller.dart';
import 'package:vp18_data_app_1/providers/note_provider.dart';




class NoteScreen extends StatefulWidget {
  const NoteScreen({Key? key,this.note}) : super(key: key);

  final Note? note;



  @override
  State<NoteScreen> createState() => _NoteScreenState();
}
late TextEditingController _titleTextController;
late TextEditingController _infoTextController;
class _NoteScreenState extends State<NoteScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleTextController = TextEditingController(text: widget.note?.title);
    _infoTextController = TextEditingController(text: widget.note?.info);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _titleTextController.dispose();
    _infoTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title,),),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(children: [
          TextField(
            controller: _titleTextController,
            keyboardType: TextInputType.text,
            style: GoogleFonts.tajawal(),
            decoration: InputDecoration(
              hintText: "Title ",
              prefixIcon: Icon(Icons.title,),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),),

          ),
          SizedBox(height: 10,),
          TextField(
            controller: _infoTextController,
            keyboardType: TextInputType.text,
            style: GoogleFonts.tajawal(),

            decoration: InputDecoration(
              hintText: "Info",
              prefixIcon: Icon(Icons.info,),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),),

          ),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: () => _performSave(),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              minimumSize: Size(double.infinity, 45),
            ),
            child: Text("SAVE"),),
        ],),
      ),

    );
  }

  String get title => isNewNote ? 'Create note ' : 'Update note ';

  bool get isNewNote => widget.note == null;

  void _performSave() {
    if (_checkData()) {
      _save();
    }
  }

  bool _checkData() {
    if (_titleTextController.text.isNotEmpty &&
        _infoTextController.text.isNotEmpty) {
      return true;
    }
    context.showSnackar(massage:"Enter Reqied data", error : true);
    return false;
  }

  void _save() async {
    ProcessResponse processResponse = isNewNote
        ? await Provider.of<NoteProvider>(context,listen: false).create(note)
        : await Provider.of<NoteProvider>(context,listen: false).update(note);

    context.showSnackBar(massage: processResponse.massage , error :!processResponse.success);

    if(processResponse.success){
      isNewNote ? _clear() :Navigator.pop(context);

    }
  }
void _clear(){
    _titleTextController.clear();
    _infoTextController.clear();
}
  Note get note {
    Note note = isNewNote ? Note() : widget.note!;
    note.title = _titleTextController.text;
    note.info = _infoTextController.text;
    note.userId = SharedPrefController().getValues(PrefKeys.id.name)!;
    return note;
  }
}