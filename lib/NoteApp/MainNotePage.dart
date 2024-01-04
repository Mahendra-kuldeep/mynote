import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mynote/NoteApp/addNote.dart';
import 'package:provider/provider.dart';

import '../DbHelperProvider/Provider.dart';
import '../DbModel/NoteModel.dart';

class MainNotePage extends StatefulWidget {
  const MainNotePage({super.key});

  @override
  State<MainNotePage> createState() => _MainNotePageState();
}

class _MainNotePageState extends State<MainNotePage> {
  @override
  void initState() {
    super.initState();
    getnotes();
  }
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
  getnotes(){
    context.read<NotesProvider>().fatchinitialnotes();
  }

  //update provider
  updatenotes(String utitle ,String udesc){
    context.read<NotesProvider>().updateNotes(NoteModel(title: utitle, desc: udesc));
  }

  //delete provider
  deletenotedata(int note_id){
    context.read<NotesProvider>().deleteNotes(note_id);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text("𝐔𝐩𝐝𝐚𝐭𝐞 𝐍𝐨𝐭𝐞",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.black),),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 13),
                child: TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Title",
                    hintStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black)
                  ),
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 13),
                child: Expanded(
                  child: TextField(
                    controller: descController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Title",
                        hintStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.black)
                    ),
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
      floatingActionButton: Container(
          height: 47,
          width: 140,
          child: FloatingActionButton(onPressed: (){
            addnotedata(titleController.text.toString(), descController.text.toString());
            Navigator.pop(context);
          },shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),splashColor: Colors.grey,
              backgroundColor: Colors.blue
            ,child: Text("𝙐𝙥𝙙𝙖𝙩𝙚 𝙉𝙤𝙩𝙚",style: TextStyle(fontSize: 17,color: Colors.white),),)),
    );
  }
}
