import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
 final   String jobsTable = 'jobs';
 final String bookMarkTable = 'bookMark';

class DbHelper {
  DbHelper._();

 static final DbHelper _instance = DbHelper._();   // ✅ ek hi baar banaya
  static DbHelper getInstance() => _instance;    

  Database? myDb;

  getDb()async{
    if(myDb != null){
      return myDb;
    }else{
     myDb= await openDb();
     return myDb;
    }  
  }
  
  
}

Future<Database> openDb() async{
  Directory appPath = await getApplicationDocumentsDirectory();
  String dbPath = join(appPath.path, 'remotely.db');
  return await openDatabase(dbPath, onCreate: (db, version) {

    db.execute("create table $jobsTable(id integer primary key autoincrement,isBookMarked bool, title text, companyName text, location text, jobType text, salary text, description text)");
    db.execute("create table $bookMarkTable(id integer primary key autoincrement,isBookMarked bool, title text, companyName text, location text, jobType text, salary text, description text)");

  },version: 1);
}