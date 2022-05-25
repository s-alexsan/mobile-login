import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart' show join;

class Crud {
  Database? db;

  Future<void> connect() async => db = await database();

  Future<int> insert(String tabela, Map<String, dynamic> objMap) async => await db!.insert(
        tabela,
        objMap,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

  Future<int> delete(String tabela, {String? where, List<String>? whereArgs}) async =>
      await db!.delete(
        tabela,
        where: where,
        whereArgs: whereArgs,
      );

  Future<int> update(String tabela, Map<String, dynamic> objMap,
          {String? where, List<String>? whereArgs}) async =>
      await db!.update(
        tabela,
        objMap,
        where: where,
        whereArgs: whereArgs,
      );

  Future<List<Map<String, dynamic>>> read(String tabela,
          {int? limit,
          String? orderBy,
          String? where,
          List<String>? whereArgs,
          int? offset,
          List<String>? columns}) async =>
      await db!.query(
        tabela,
        limit: limit,
        orderBy: orderBy,
        where: where,
        whereArgs: whereArgs,
        offset: offset,
        columns: columns,
      );

  Future<Database> database() async {
    WidgetsFlutterBinding.ensureInitialized();
    final Future<Database> database = openDatabase(
      join(await getDatabasesPath(), 'app_login.db'),
      version: 1,
      onUpgrade: (db, oldVersion, newVersion) async {
        List<String> queryes = [];
        await Future.forEach(queryes, (String element) async {
          await db.execute(element);
        });
      },
      onCreate: (db, version) async {
        List<String> queryes = [
          "CREATE TABLE IF NOT EXISTS AUT_USUARIO (PK_USUARIO INTEGER PRIMARY KEY AUTOINCREMENT, USERNAME TEXT,PASSWORD TEXT);",
        ];
        await Future.forEach(queryes, (String element) async {
          await db.execute(element);
        });
      },
    );
    return database;
  }
}
