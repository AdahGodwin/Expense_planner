import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Future<Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, 'expenses.db'),
        onCreate: (db, version) async {
      await db.execute(
          'CREATE TABLE expenses(id TEXT PRIMARY KEY, title TEXT, amount INTEGER, date INTEGER, key TEXT, category TEXT)');
      await db.execute(
          'CREATE TABLE income(id TEXT PRIMARY KEY, title TEXT, amount INTEGER, date INTEGER, key TEXT)');
      await db.execute(
          'CREATE TABLE user(id TEXT PRIMARY KEY, firstname TEXT, lastname TEXT, email TEXT, image TEXT, balance INTEGER)');
      await db.execute('''
      CREATE TABLE theme(
        themeData TEXT
      )
    ''');
    }, version: 1);
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DBHelper.database();
    db.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<void> update(String table, Map<String, Object> data) async {
    final db = await DBHelper.database();

    db.update(table, data);
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DBHelper.database();
    return db.query(table);
  }
}
