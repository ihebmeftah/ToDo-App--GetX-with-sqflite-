// ignore_for_file: prefer_const_declarations

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static const int _version = 1;
  static const String _tableName = 'tasks';
  static Database? db;

  static Future<void> initDb() async {
    if (db != null) {
      debugPrint('not null db');
    } else {
      try {
        String path = await getDatabasesPath() + 'task.db';
        db = await openDatabase(
          path,
          version: _version,
          onCreate: (db, version) async {
            await db.execute(
              'CREATE TABLE $_tableName ('
              'id INTEGER PRIMARY KEY AUTOINCREMENT,'
              ' title STRING, '
              ' note TEXT, '
              ' date STRING, '
              ' startTime STRING, '
              ' endTime STRING, '
              ' remind INTEGER,'
              ' repeat STRING, '
              ' color INTEGER,'
              ' isCompleted INTEGER)',
            );
          },
        );
      } catch (e) {
        print(e);
      }
    }
  }
}
