import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class SendHistoryDao {

  static const _databaseName = 'SendToJoin.db';
  static const _databaseVersion = 1;

  static const table = 'sendHistory';
  static const columnId = 'id';
  static const columnText = 'text';
  static const columnDate = 'date';

  static Database? _database;
  Future<Database> get database async =>
      _database ??= await _initDatabase();

  SendHistoryDao._privateConstructor();
  static final SendHistoryDao instance = SendHistoryDao._privateConstructor();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
           $columnId INTEGER PRIMARY KEY,            
           $columnText TEXT,
           $columnDate TEXT
          )
          ''');

    //max items = 15
    Batch batch = db.batch();
    for(int i = 1; i <= 15 ; i++) {
      batch.insert('sendHistory', {'id': i, 'text': '','date':''});
    }
    await batch.commit(noResult: true);

    await db.execute('''
          CREATE TRIGGER deleteOnAdd
          AFTER INSERT ON $table           
          BEGIN
            DELETE FROM $table WHERE $columnId IN (SELECT $columnId FROM $table LIMIT 1);
          END;
          
          ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  Future<List<Map<String, dynamic>>> queryAllRowsDesc() async {
    Database db = await instance.database;
    return await db.rawQuery('SELECT * FROM $table ORDER BY id DESC');
  }
  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }

}