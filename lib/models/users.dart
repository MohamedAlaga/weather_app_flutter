import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> openUserDatabase() async {
  final databasePath = await getDatabasesPath();
  final path = join(databasePath, 'user_database.db');
  print("path is $path");
  return openDatabase(
    path,
    version: 1,
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE users(id INTEGER PRIMARY KEY, email TEXT UNIQUE, password TEXT, token TEXT)',
      );
    },
  );
}
