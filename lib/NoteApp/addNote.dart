import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mynote/DbHelper/DbHelper.dart';
import 'package:mynote/DbHelperProvider/Provider.dart';
import 'package:mynote/DbModel/NoteModel.dart';
import 'package:mynote/UiHelper/CustomWidgets.dart';
import 'package:provider/provider.dart';

class addNotes extends StatefulWidget {
  const addNotes({super.key});

  @override
  State<addNotes> createState() => _addNotesState();
}

class _addNotesState extends State<addNotes> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  addnotedata(String title ,String desc){
  if(title=="" && desc ==""){
    log("Pleae fill required fields");
  }
  else{
    context.read<NotesProvider>().addData(NoteModel(title: title, desc: desc));
  }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.blue,
            Colors.white60
          ],begin: Alignment.topLeft,end: Alignment.bottomRight),
      ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("❝𝐀𝐝𝐝 𝐍𝐨𝐭𝐞❞",style: TextStyle(fontSize: 25),),
            UiHelper().CustomTf(6, "𝚃𝚒𝚝𝚕𝚎", Icons.title, titleController,"𝐓𝐢𝐭𝐥𝐞"),
            UiHelper().CustomTf(6, "𝙳𝚎𝚜𝚌𝚛𝚒𝚙𝚝𝚒𝚘𝚗𝚜", Icons.description_outlined, descController,"𝐃𝐞𝐬𝐜𝐫𝐢𝐩𝐭𝐢𝐨𝐧𝐬"),
            SizedBox(height: 10,),
            Container(
                height: 46,
                width: 130,
                child: Card(
                  elevation: 10,
                  child: ElevatedButton(onPressed: (){
                    addnotedata(titleController.text.toString(), descController.text.toString());
                    log("Data Submited");
                    Navigator.pop(context);

                  },style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3))),
                      child: Text("Save",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),)),
                ))
          ],
        )
    )
    );
  }
}
