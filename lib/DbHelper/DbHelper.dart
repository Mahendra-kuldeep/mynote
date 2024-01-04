import 'dart:io';
import 'dart:ui';

import 'package:mynote/DbModel/NoteModel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  DbHelper._();
  static final DbHelper dbhelp = DbHelper._();
  static const notetable="note";
  static const Column_id="noteid";
  static const Column_title="notetitle";
  static const Column_desc="notedesc";
  Database? _database;

  Future<Database>getDb()async{
    if(_database!=null){
      return _database!;
    }
    else{
      return await initDB();
    }
  }
  Future<Database>initDB()async{
    Directory directory = await getApplicationDocumentsDirectory();
    var dbpath = join(directory.path+"notedb.db");
    return await openDatabase(dbpath,version: 1,onCreate: (db,version){
      return db.execute("create table $notetable($Column_id integer primary key autoincrement ,$Column_title text , $Column_desc text)");
    });
  }

  insertNote(NoteModel noteModel)async{
    var db = await getDb();
    await db.insert(notetable, noteModel.toMap());
  }
  Future<List<NoteModel>>getData()async{
    var db = await getDb();
    List<NoteModel>arrNotes = [];
    var data = await db.query(notetable);
    for(Map<String,dynamic>eachData in data){
      NoteModel noteModel = NoteModel.fromMap(eachData);
      arrNotes.add(noteModel);
    }
    return arrNotes;
  }
  Future<bool>updateNotes(NoteModel note)async{
    var db = await getDb();
    var count = await db.update(notetable, note.toMap(),where: "$Column_id=${note.id}");
    return count>0;
}

 // Future<void>deletenotes(int id)async{
 //    var db = await getDb();
 //    await db.delete(notetable,where: "$Column_id=",whereArgs: [id]);
 // }

  Future<bool> deleteNote(int id) async {
    var db = await getDb();
    var count1 = await db.delete(notetable, where: "$Column_id = ?", whereArgs: [id.toString()]);
    return count1 > 0;
  }
}