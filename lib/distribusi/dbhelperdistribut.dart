import 'dart:developer';
import 'dart:io';
import 'package:skripsi/distribusi/distribusimodel.dart';
import 'package:skripsi/distribusi/model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqlite_api.dart';

abstract class DBHelper {
  static Database? _db;

  static int get _version => 1;

  static Future<void> init() async {
    if (_db != null) {
      return;
    }
    try {
      var databasePath = await getDatabasesPath();
      String _path = p.join(databasePath, 'matkul_database.db');
      _db = await openDatabase(_path,
          version: _version, onCreate: oncreate, onUpgrade: onupgrade);
    } catch (ex) {
      print(ex);
    }
  }

  static void oncreate(Database db, int version) async {
    String SqlQuery =
        'CREATE TABLE matkul (id INTEGER PRIMARY KEY AUTOINCREMENT, nama STRING ,categoryId INTEGER,  nilai INTEGER, keterangan STRING )';
    await db.execute(SqlQuery);
  }

  static void onupgrade(Database db, int oldversion, int version) async {
    if (oldversion > version) {
      //
    }
  }

  static Future<List<Map<String, dynamic>>> query(String table) async {
    return _db!.query(table);
  }

  static Future<int> insert(String table, Model model) async {
    return await _db!.insert(table, model.toJson());
  }

  static Future<int> update(String table, Model model) async {
    return await _db!
        .update(table, model.toJson(), where: 'id = ?', whereArgs: [model.id]);
  }

  static Future<int> delete(String table, Model model) async {
    return await _db!.delete(table, where: 'id = ?', whereArgs: [model.id]);
  }
}












// class Databasedistribusi {
//   final String databaseNAme = 'Distribusi_Matakulias.db';
//   final int databaseVersion = 2;

//   final String tabel = 'Matakuliah';
//   final String id = 'id';
//   final String nama = 'matkul';
//   final String sks = 'sks';
//   final String nilai = 'Nilai';
//   final String ket = 'Keterangan';
//   final String createdAt = 'created_at';
//   final String updatedAt = 'updated_at';

//   Database? _database;

//   Future<Database> database() async {
//     if (_database != null) return _database!;
//     _database = await _initDatabase();
//     print('databse:$_database');
//     return _database!;
//   }

//   Future<Database> _initDatabase() async {
//     Directory databaseDirectory = await getApplicationDocumentsDirectory();
//     String path = join(databaseDirectory.path, databaseNAme);
//     print('database init');
//     return openDatabase(path, version: databaseVersion, onCreate: _oncreate);
//   }

//   Future _oncreate(Database db, int version) async {
//     // final data =
//     await db.execute(
//         'CREATE TABLE ${tabel} ($id INTEGER PRIMARY KEY, $nama TEXT NULL, $nilai TEXT NULL, $ket TEXT NULL, $createdAt TEXT NULL, $updatedAt TEXT NULL)');
//     // print('data: ${data}');
//   }

//   // Future<List<DistribusiModel>> all() async {
//   //   final data = await _database!.query(tabel);
//   //   print('data:$data');
//   //   List<DistribusiModel> result =
//   //       data.map((e) => DistribusiModel.fromJson(e)).toList();
//   //   return result;
//   // }

//   Future<int> insert(Map<String, dynamic> row) async {
//     final query = await _database!.insert(tabel, row);
//     return query;
//   }
// }
