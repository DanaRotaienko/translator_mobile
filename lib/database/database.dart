import 'dart:io';

import 'package:final_project/models/TranslationDTO.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'translations.db');
    return await openDatabase(
      path,
      version: 2,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE list(
          id INTEGER PRIMARY KEY,
          source TEXT,
          target TEXT,
          input TEXT,
          output TEXT
      )
      ''');
  }

  Future<List<TranslationDto>> getTranslations() async {
    Database db = await instance.database;
    var translations = await db.query('list', orderBy: 'id DESC');
    List<TranslationDto> translationsList = translations.isNotEmpty
        ? translations.map((c) => TranslationDto.fromMap(c)).toList()
        : [];
    return translationsList;
  }

  Future<int> add(TranslationDto translation) async {
    Database db = await instance.database;
    return await db.insert('list', translation.toMap());
  }

  Future<int> remove(int id) async {
    Database db = await instance.database;
    return await db.delete('list', where: 'id = ?', whereArgs: [id]);
  }
}
