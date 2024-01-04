import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mynote/DbHelperProvider/Provider.dart';
import 'package:mynote/DbModel/NoteModel.dart';
import 'package:provider/provider.dart';

import 'MainNotePage.dart';
import 'UpdateNote.dart';
import 'addNote.dart';

class NoteApp extends StatefulWidget {
  const NoteApp({super.key});

  @override
  State<NoteApp> createState() => _NoteAppState();
}

class _NoteAppState extends State<NoteApp> {
  @override
  void initState() {
    super.initState();
    getnotes();
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
    return Consumer<NotesProvider>(
      builder: (_,provider,__){
        return Scaffold(
          appBar: AppBar(
            title: Text("𝐌𝐲 𝐍𝐨𝐭𝐞𝐬",style: TextStyle(fontSize: 23,color: Colors.white),),
            backgroundColor: Colors.blue,
            centerTitle: true,
          ),
          body: ListView.builder(itemBuilder: (BuildContext _,index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.5),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateNote( id: provider.arrList[index].id,uptitle: provider.arrList[index].title, updesc: provider.arrList[index].desc)));
                },
                child: Container(
                  height: 95,
                  width: 500,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                  ),
                  child: Center(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text("${provider.arrList[index].id}"),
                      ),
                      title: Text("${provider.arrList[index].title}"),
                      subtitle: Text("${provider.arrList[index].desc}"),
                      trailing: IconButton(onPressed: ()async{
                        await deletenotedata(provider.arrList[index].id!);
                      }, icon: Icon(Icons.delete_forever_outlined,)),
                    ),
                    ),
                  ),
              ),
            );
          },itemCount: provider.arrList.length,),
          floatingActionButton: Card(
            elevation: 10,
            child: FloatingActionButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>addNotes()));
            },child: Icon(Icons.note_add_outlined),),
          ),
        );
      },
    );
  }
}
