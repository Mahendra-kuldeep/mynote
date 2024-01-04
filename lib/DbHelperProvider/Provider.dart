import 'package:flutter/material.dart';
import 'package:mynote/DbHelper/DbHelper.dart';

import '../DbModel/NoteModel.dart';

class NotesProvider extends ChangeNotifier{
  List<NoteModel>arrList = [];
  DbHelper myDb = DbHelper.dbhelp;
 
  //default notes
  addData(NoteModel noteModel)async{
    var check = await myDb.insertNote(noteModel);
    if(check==true){
      arrList = await myDb.getData();
      notifyListeners();
    }
  }
  // data when add
  fatchinitialnotes()async{
    arrList = await myDb.getData();
    notifyListeners();
  }
  //new data 
  List<NoteModel>getnotes(){
    fatchinitialnotes();
    return arrList;
  }
  updateNotes(NoteModel noteModel) async {
    var check = await myDb.updateNotes(noteModel);
    if (check) {
      arrList = await myDb.getData();
      notifyListeners();
    }
  }

  // deleteNotes(int note_id)async {
  //   var check1 = await myDb.deletenotes(note_id);
  //   if(check1){
  //     arrList = await myDb.getData();
  //     notifyListeners();
  //   }
  //
  // }
  deleteNotes(int id)async{
    var check=await myDb.deleteNote(id);
    if(check){
      arrList=await myDb.getData();
      notifyListeners();
    }
  }
}