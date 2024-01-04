import 'package:mynote/DbHelper/DbHelper.dart';

class NoteModel{
  int? id;
  String title;
  String desc;

  NoteModel({required this.title,required this.desc,this.id});

  factory NoteModel.fromMap(Map<String,dynamic>map){
    return NoteModel(title: map[DbHelper.Column_title], desc: map[DbHelper.Column_desc],id: map[DbHelper.Column_id]);
  }
  Map<String,dynamic>toMap(){
    return {
      DbHelper.Column_id :id,
      DbHelper.Column_title:title,
      DbHelper.Column_desc:desc
    };
  }
}