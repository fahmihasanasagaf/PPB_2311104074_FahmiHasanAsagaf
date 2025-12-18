import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  static Database? _database;

  DatabaseHelper._internal();

  // Factory
  factory DatabaseHelper(){
    return _instance;
  }

  // Getter
  Future<Database> get database async {
    if(_database != null) return _database!;
    {
      _database = await _initDatabase();
      return _database!;
    }
  }

  // Init Database
  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'ppbsqlite.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE mahasiswa(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    nama TEXT,
    nim INTEGER
    )
 ''');
  }

  // Create 
  Future<int> create (Map<String, dynamic> row) async {
    Database db = await database;
    return await db.insert('mahasiswa', row);
  }

  // Read
  Future<List<Map<String, dynamic>>> read() async {
  Database db = await database;
  return await db.query('mahasiswa');
}


  // Update 
  Future<int> update(Map<String,dynamic> row) async {
    Database db = await database;
    int id = row['id'];
    return await db.update('mahasiswa', row, where: 'id = ?', whereArgs: [id]);
  }

  // Delete
  Future<int> delete(int id) async {
    Database db = await database;
    return await db.delete('mahasiswa', where: 'id = ?', whereArgs: [id] );
  }


}