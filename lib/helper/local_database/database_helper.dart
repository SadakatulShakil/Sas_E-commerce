import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../Models/address_model.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), 'address_data.db');
    return await openDatabase(
      path,
      version: 2, // Increment the version number
      onCreate: _onCreate,
      onUpgrade: _onUpgrade, // Add this line
    );
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < newVersion) {
      await db.execute('DROP TABLE IF EXISTS user'); // Drop the existing table
      _onCreate(db, newVersion); // Recreate the table with new schema
    }
  }



  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE user (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      username TEXT,
      label TEXT,
      type TEXT,
      delivery_address TEXT,
      city TEXT,
      zip_code TEXT,
      country TEXT,
      contact_person TEXT,
      contact_no TEXT
    )
  ''');
  }


  Future<void> insertUserData(String username, AddressDataModel userDataModel) async {
    final db = await instance.database;
    try{
      await db.insert(
        'user',
        {
          'username': username,
          ...userDataModel.toMap(),
        },
        conflictAlgorithm: ConflictAlgorithm.replace,

      );
    }catch(e){
      print('insert: '+e.toString());
    }
  }

  Future<void> updateUserData(AddressDataModel userDataModel) async {
    final db = await instance.database;
    try {
      await db.update(
        'user',
        userDataModel.toMap(),
        where: 'id = ?',
        whereArgs: [userDataModel.id],
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
     // print('UserData updated successfully.');
    } catch (e) {
     // print('Error updating UserData: $e');
    }
  }

  Future<List<AddressDataModel>> getAllUserDataByUsername(String username) async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'user',
      where: 'username = ?',
      whereArgs: [username],
    );

    return List.generate(maps.length, (i) {
      return AddressDataModel.fromMap(maps[i]);
    });
  }

  Future<void> markDataAsSynced(List<int?> ids) async {
    final db = await instance.database;
    for (var id in ids) {
      await db.update(
        'user',
        {'is_synced': "Yes"}, // 1 or true to mark as synced
        where: 'id = ?',
        whereArgs: [id],
      );
    }
  }

  Future<void> removeSyncedData(List<int?> ids) async {
    final db = await instance.database;
    for (var id in ids) {
      await db.delete(
        'user',
        where: 'id = ?',
        whereArgs: [id],
      );
    }
  }

  Future<void> deleteData(int id) async {
    final db = await DatabaseHelper.instance.database;
    await db.delete(
      'user',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
