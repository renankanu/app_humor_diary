import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHelper {
  static Future<Database> dataBase() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, 'humor.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE user_humors(datetime TEXT PRIMARY KEY, humor TEXT, image TEXT,actimage TEXT,actname TEXT,date TEXT)');
    }, version: 1);
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DBHelper.dataBase();
    db.insert(
      table,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DBHelper.dataBase();
    var res = await db.rawQuery("SELECT * FROM $table");
    return res.toList();
  }

  static Future<void> delete(String datetime) async {
    final db = await DBHelper.dataBase();
    await db
        .rawDelete('DELETE FROM user_humors WHERE datetime = ?', [datetime]);
  }
}
