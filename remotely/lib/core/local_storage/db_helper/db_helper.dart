import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
 final   String tableName = 'jobs';

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


  // final int id;
  // final String title;
  // final String companyName;
  // final String companyLogo;
  // final String location;
  // final String jobType;
  // final List<String> tags;
  // final String salary;

    db.execute("create table $tableName(id integer primary key autoincrement, title text, companyName text, location text, jobType text, salary text)");
    
  },version: 1);
}