import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mynote/DbHelperProvider/Provider.dart';
import 'package:mynote/DbModel/NoteModel.dart';
import 'package:provider/provider.dart';

class UpdateNote extends StatefulWidget {
  String uptitle;
  String updesc;
  int? id;
  UpdateNote({required this.uptitle,required this.updesc,this.id});
  // const UpdateNote({super.key});

  @override
  State<UpdateNote> createState() => _UpdateNoteState();
}

class _UpdateNoteState extends State<UpdateNote> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  updatednote(String title , String desc){
    context.read<NotesProvider>().updateNotes(NoteModel(title: title, desc: desc,));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("𝐔𝐩𝐝𝐚𝐭𝐞 𝐍𝐨𝐭𝐞",style: TextStyle(fontSize: 20),),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(13),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 13),
              child: TextField(
                controller: titleController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: widget.uptitle,
                    //labelText: "${widget.uptitle}",
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
                      hintText: widget.updesc,
                      //labelText: " ${widget.updesc}",
                      hintStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.black)
                  ),
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.black),
                ),
              ),
            ),
          ],
        ),
        ),
      floatingActionButton: Container(
          height: 47,
          width: 140,
          child: FloatingActionButton(onPressed: (){
            log("updated");
            updatednote(titleController.text.toString(), descController.text.toString());

            Navigator.pop(context);
          },shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),splashColor: Colors.grey,
            backgroundColor: Colors.blue
            ,child: Text("𝙐𝙥𝙙𝙖𝙩𝙚 𝙉𝙤𝙩𝙚",style: TextStyle(fontSize: 17,color: Colors.white),),)),
    );
  }
}
