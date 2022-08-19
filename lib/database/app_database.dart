import 'package:bytebank/database/dao/contato_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final String dbpath = await getDatabasesPath();
  final String path = join(dbpath, 'bytebank.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(ContatoDAO.tableSql);
    },
    version: 1,
    // onDowngrade: onDatabaseDowngradeDelete,
  );
}
