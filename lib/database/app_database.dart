import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/contato.dart';

Future<Database> getDatabase() async {
  final String dbpath = await getDatabasesPath();
  final String path = join(dbpath, 'bytebank.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute('CREATE TABLE contatos('
          'id INTEGER PRIMARY KEY, '
          'nome TEXT, '
          'numero_conta INTEGER)');
    },
    version: 1,
    onDowngrade: onDatabaseDowngradeDelete,
  );
}

Future<int> save(Contato contato) async {
  final Database db = await getDatabase();
  final Map<String, dynamic> mapaContato = Map();
  mapaContato['nome'] = contato.nome;
  mapaContato['numero_conta'] = contato.numeroConta;
  return db.insert('contatos', mapaContato);

  // return getDatabase().then((db) {
  //   final Map<String, dynamic> mapaContato = Map();
  //   mapaContato['nome'] = contato.nome;
  //   mapaContato['numero_conta'] = contato.numeroConta;
  //   return db.insert('contatos', mapaContato);
  // });
}

Future<List<Contato>> findAll() async {
  final Database db = await getDatabase();
  final List<Map<String, dynamic>> registros = await db.query('contatos');
  final List<Contato> contatos = [];
  for (Map<String, dynamic> registro in registros) {
    final Contato contato = Contato(
      registro['id'],
      registro['nome'],
      registro['numero_conta'],
    );
    contatos.add(contato);
  }
  return contatos;
}
