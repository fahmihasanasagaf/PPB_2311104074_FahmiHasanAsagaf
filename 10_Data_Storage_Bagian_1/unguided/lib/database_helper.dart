import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;
  static const String tableName = 'mahasiswa';
  static const String columnId = 'id';
  static const String columnNama = 'nama';
  static const String columnNim = 'nim';
  static const String columnAlamat = 'alamat';
  static const String columnHobi = 'hobi';

  // Tambahkan getter untuk database
  static Future<Database> get db async {
    return await database;
  }

  static Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  static Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'biodata_mahasiswa.db');
    
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createTable,
    );
  }

  static Future<void> _createTable(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableName (
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnNama TEXT NOT NULL,
        $columnNim TEXT NOT NULL,
        $columnAlamat TEXT NOT NULL,
        $columnHobi TEXT NOT NULL
      )
    ''');
    print('Table $tableName created successfully');
  }

  // CREATE - Menyimpan data mahasiswa
  static Future<int> insertMahasiswa(Map<String, dynamic> mahasiswa) async {
    try {
      final db = await database;
      final result = await db.insert(
        tableName, 
        mahasiswa,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      print('Data inserted successfully with ID: $result');
      return result;
    } catch (e) {
      print('Error inserting data: $e');
      return -1;
    }
  }

  // READ - Membaca semua data mahasiswa
  static Future<List<Map<String, dynamic>>> getMahasiswa() async {
    try {
      final db = await database;
      final result = await db.query(tableName);
      print('Data fetched successfully: ${result.length} records');
      return result;
    } catch (e) {
      print('Error fetching data: $e');
      return [];
    }
  }

  // UPDATE - Memperbarui data mahasiswa
  static Future<int> updateMahasiswa(Map<String, dynamic> mahasiswa) async {
    try {
      final db = await database;
      final result = await db.update(
        tableName,
        mahasiswa,
        where: '$columnId = ?',
        whereArgs: [mahasiswa[columnId]],
      );
      print('Data updated successfully');
      return result;
    } catch (e) {
      print('Error updating data: $e');
      return -1;
    }
  }

  // DELETE - Menghapus data mahasiswa
  static Future<int> deleteMahasiswa(int id) async {
    try {
      final db = await database;
      final result = await db.delete(
        tableName,
        where: '$columnId = ?',
        whereArgs: [id],
      );
      print('Data deleted successfully');
      return result;
    } catch (e) {
      print('Error deleting data: $e');
      return -1;
    }
  }
}