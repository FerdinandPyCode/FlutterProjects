import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'tache.dart';

class DatabaseHandler {

   static const _databaseName = "Todo.db";
   static const _databaseVersion = 10;

   static const table = 'Todo';
   static const columnId = 'id';
   static const columnDescription = 'description';
   static const columnTitre = 'titre';
   static const columnDateDebut = 'DateBegin';
   static const columnDateEnd = 'DateEnd';
   static const columnDateEnreg = 'DateEnreg';
   static const columnStatus = 'Status';

  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, _databaseName),
      onCreate: (database, version) async {
        await database.execute(
           """CREATE TABLE $table (
             $columnId INTEGER PRIMARY KEY,
             $columnTitre TEXT NOT NULL,
             $columnDescription TEXT NOT NULL,
             $columnDateDebut INTEGER NOT NULL,
             $columnDateEnd INTEGER NOT NULL,
             $columnDateEnreg INTEGER NOT NULL,
             $columnStatus INTEGER NOT NULL)""");
      },
      version:_databaseVersion,
    );
  }

  Future<void> insertTodo(Todo todo) async {
    final db = await initializeDB();
    await db.insert(
      table,
      todo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Todo>> allTodo() async {
    final db = await initializeDB();
    final List<Map<String, dynamic>> queryResult = await db.query(table);
    return queryResult.map((e) => Todo.fromMap(e)).toList();
  }

  Future<void> deleteTodo(int id) async {
    final db = await initializeDB();
    await db.delete(
      table,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<Todo>> futureTodo() async {
      final db = await initializeDB();
      final List<Map<String, dynamic>> queryResult = await db.rawQuery(
        """


      """);
      return queryResult.map((e) => Todo.fromMap(e)).toList();
    }

}