import 'package:path/path.dart';
import 'package:restoran_serba_ada/model/history_model.dart';
import 'package:restoran_serba_ada/model/wishlist_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;

  static late Database _database;
  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  Future<Database> get database async {
    _database = await _initializeDb();
    return _database;
  }

  final String _tableNameFirst = 'wishlist';
  final String _tableNameSecond = 'history';

  Future<Database> _initializeDb() async {
    var db = openDatabase(
      join(await getDatabasesPath(), 'restoran_app_db.db'),
      onCreate: (db, version) async {
        await db.execute(
          '''
          CREATE TABLE $_tableNameFirst(
            idMenu TEXT PRIMARY KEY,
            namaMenu TEXT,
            kategoriMenu TEXT,
            fotoMenu TEXT,
            harga INTEGER,
            jumlah INTEGER
          )''',
        );
        await db.execute(
          '''
          CREATE TABLE $_tableNameSecond(
            idMenu TEXT PRIMARY KEY,
            namaMenu TEXT,
            kategoriMenu TEXT,
            fotoMenu TEXT,
            harga INTEGER,
            jumlah INTEGER
          )''',
        );
      },
      version: 1,
    );
    return db;
  }

  Future<void> insertWishlist(WishlistModel wishlistModel) async {
    final Database db = await database;
    await db.insert(_tableNameFirst, wishlistModel.toMap());
  }

  Future<List<WishlistModel>> getWishlist() async {
    final Database db = await database;
    List<Map<String, dynamic>> result = await db.query(_tableNameFirst);
    return result.map((e) => WishlistModel.fromMap(e)).toList();
  }

  Future<WishlistModel> getWishlistById(String id) async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(
      _tableNameFirst,
      where: 'idMenu = ?',
      whereArgs: [id],
    );
    return results.map((e) => WishlistModel.fromMap(e)).first;
  }

  Future<void> updateWishlist(WishlistModel wishlistModel) async {
    final db = await database;
    await db.update(
      _tableNameFirst,
      wishlistModel.toMap(),
      where: 'idMenu = ?',
      whereArgs: [wishlistModel.idMenu],
    );
  }

  Future<void> deleteWishlist(String id) async {
    final db = await database;
    await db.delete(
      _tableNameFirst,
      where: 'idMenu = ?',
      whereArgs: [id],
    );
  }

  Future<void> insertHistory(HistoryModel historyModel) async {
    final Database db = await database;
    await db.insert(_tableNameSecond, historyModel.toMap());
  }

  Future<List<HistoryModel>> getHistory() async {
    final Database db = await database;
    List<Map<String, dynamic>> result = await db.query(_tableNameSecond);
    return result.map((e) => HistoryModel.fromMap(e)).toList();
  }

  Future<HistoryModel> getHistoryById(String id) async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(
      _tableNameSecond,
      where: 'idMenu = ?',
      whereArgs: [id],
    );
    return results.map((e) => HistoryModel.fromMap(e)).first;
  }

  Future<void> updateHistory(HistoryModel historyModel) async {
    final db = await database;
    await db.update(
      _tableNameSecond,
      historyModel.toMap(),
      where: 'idMenu = ?',
      whereArgs: [historyModel.idMenu],
    );
  }

  Future<void> deleteHistory(String id) async {
    final db = await database;
    await db.delete(
      _tableNameSecond,
      where: 'idMenu = ?',
      whereArgs: [id],
    );
  }
}
