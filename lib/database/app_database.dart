import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/contato.dart';

Future<Database> createDatabase() {
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'bytebank.db');
    return openDatabase(path, onCreate: (db, version) {
      db.execute('CREATE TABLE contatos('
          'id INTEGER PRIMARY KEY, '
          'nome TEXT, '
          'numero_conta INTEGER)');
    }, version: 1);
  });
}

Future<int> save(Contato contato) {
  return createDatabase().then((db) {
    final Map<String, dynamic> mapaContato = Map();
    mapaContato['nome'] = contato.nome;
    mapaContato['numero_conta'] = contato.numeroConta;
    return db.insert('contatos', mapaContato);
  });
}

Future<List<Contato>> findAll() {
  return createDatabase().then((db) {
    return db.query('contatos').then((maps) {
      final List<Contato> contatos = [];
      for (Map<String, dynamic> map in maps) {
        final Contato contato = Contato(
          map['id'],
          map['nome'],
          map['numero_conta'],
        );
        contatos.add(contato);
      }
      return contatos;
    });
  });
}
