import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'model.dart';

class DatabaseHandler {

  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'peopledatabase.db'),
      onCreate: (database, version) async {
        await database.execute(
          """CREATE TABLE people(
            id INTEGER PRIMARY KEY,
            firstname TEXT,
            lastname TEXT,
            adress TEXT,
            phone TEXT,
            mail TEXT,
            gender TEXT,
            picture TEXT,
            citation TEXT,
            birthday INTEGER
            )""",
        );
      },
      version:7,
    );
  }

  Future<void> insertpeople(Human human) async {
    final db = await initializeDB();
    await db.insert(
      'people',
      human.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Human>> allPeople() async {
    final db = await initializeDB();
    final List<Map<String, dynamic>> queryResult = await db.query('people');
    return queryResult.map((e) => Human.fromMap(e)).toList();
  }

  Future<void> deletepeople(int id) async {
    final db = await initializeDB();
    await db.delete(
      'people',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}