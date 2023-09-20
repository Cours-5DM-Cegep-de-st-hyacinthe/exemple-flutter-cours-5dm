import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHandler {
  static final DatabaseHandler _databaseHandler = DatabaseHandler._internal();

  factory DatabaseHandler() {
    return _databaseHandler;
  }

  DatabaseHandler._internal();

  Database? database;

  Future<void> initDB() async {
    database = await openDatabase(
      join(await getDatabasesPath(), 'message_database.db'),
      version: _migrationScripts.length + 1,
      onCreate: (Database db, int version) {
        _initialScript.forEach((script) async => await db.execute(script));
        _migrationScripts.forEach((script) async => await db.execute(script));
      },
      onUpgrade: (Database db, int oldVersion, int newVersion) async {
        for (var i = oldVersion - 1; i < newVersion - 1; i++) {
          await db.execute(_migrationScripts[i]);
        }
      }
    );
  }

  static final _initialScript = [
    '''
      PRAGMA foreing_keys = ON;
    ''',
    '''
      CREATE TABLE Message (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        alias TEXT NOT NULL,
        message TEXT NOT NULL
      );
    '''
  ];

  static final _migrationScripts = [
    '''
      INSERT INTO Message (alias, message) VALUES
      ("Personne 1", "Allo, ça va?"),
      ("Personne 2", "Oui, toi?")
    '''
  ];
}