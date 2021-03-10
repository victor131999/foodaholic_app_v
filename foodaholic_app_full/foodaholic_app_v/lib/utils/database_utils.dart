import 'package:foodaholic_app_v/models/menu_sqlite_model.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper{
  static const _databaseName = 'MenuData.db';
  static const _databaseVersion = 1;


  DatabaseHelper._();
  static final DatabaseHelper instance = DatabaseHelper._();

  Database _database;
  Future <Database> get database async{
    if(_database != null) return _database;
    _database = await _initDatabase();
    return _database;
    }

    _initDatabase() async{
      Directory dataDirectory = await getApplicationDocumentsDirectory();
      String dbPath = join(dataDirectory.path,_databaseName);
      return await openDatabase(dbPath, 
      version: _databaseVersion, onCreate: _onCreateDB);
    }

    _onCreateDB(Database db, int version)async{
      await db.execute('''
        CREATE TABLE ${SMenu.tblMenu}(
          ${SMenu.meId} INTEGER PRIMARY KEY AUTOINCREMENT,
          ${SMenu.meName} TEXT NOT NULL,
          ${SMenu.meCost} TEXT NOT NULL,
          ${SMenu.meDescription} TEXT NOT NULL
        )

      ''');
    }

    Future<int> insertSMenu(SMenu smenu) async{
      Database db = await database;
      return await db.insert(SMenu.tblMenu,smenu.toMap());
    }

    Future<List<SMenu>> fetchSMenus() async{
      Database db = await database;
      List<Map> smenus = await db.query(SMenu.tblMenu);
      return smenus.length == 0
      ? []
      :smenus.map((e) => SMenu.fromMap(e)).toList();
    }
 
  }
