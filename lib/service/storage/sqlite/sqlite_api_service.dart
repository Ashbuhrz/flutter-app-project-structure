import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite_migration_service/sqflite_migration_service.dart';

const String DB_NAME = 'todo.db';

class SQliteApiService extends DatabaseMigrationService {
  static final SQliteApiService _singleton = SQliteApiService._internal();

  factory SQliteApiService() => _singleton;

  SQliteApiService._internal(); //to init any data;

  late final Database _database;

  initDB() async {
    //initialize databse to be call first in the app
    String path = join(await getDatabasesPath(), DB_NAME);
    _database = await openDatabase(path, version: 1);
    await runMigration(_database, migrationFiles: ['1_base_schema.sql']);
  }

  migrateSqliteDatabase() async {
    await _singleton
        .runMigration(_database, migrationFiles: ['1_base_schema.sql']);
  }

  Future<bool> closeDatabase() async {
    try {
      await _database.close();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> createTable(
      {required String table, required Map<String, String> fields}) async {
    //create table in the initialized database
    String columnFields = '';

    fields.forEach((key, value) {
      if (fields.entries.last.key == key)
        columnFields = columnFields + '$key $value';
      else
        columnFields = columnFields + '$key $value' + ',';
    });
    try {
      if (_database.isOpen) {
        await _database
            .execute('CREATE TABLE IF NOT EXISTS $table ( $columnFields)');
      } else {
        await initDB();
        await _database.execute('CREATE TABLE  $table ( $columnFields)');
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> insertRowInTable(
      {required String tableName, required var data}) async {
    //insert row in the table
    try {
      await _database.insert(tableName, data.toMap(),
          conflictAlgorithm: ConflictAlgorithm.ignore);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> deleteRowInTable(
      {required String tableName,
      required String whereTag,
      required var whereArg}) async {
    //delete row in the table acc to where condition
    try {
      _database
          .delete(tableName, where: '$whereTag = ?', whereArgs: [whereArg]);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> updateRowInTable(
      {required String tableName,
      required Map<String, dynamic> fieldMap,
      required String whereTag,
      required var whereArg}) async {
    //update row in the table acc to where condition
    try {
      await _database.update(tableName, fieldMap,
          where: '$whereTag = ?', whereArgs: [whereArg]);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<List<Map<String, Object?>>> readAllFromTable(
      {required String tableName}) async {
    //to retrieve all data from the table
    return await _database.query(tableName);
  }
}
