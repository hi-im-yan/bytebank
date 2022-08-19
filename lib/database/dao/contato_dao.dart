import 'package:bytebank/database/app_database.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/contato.dart';

class ContatoDAO {

  static const String _tableName = 'contatos';
  static const String _id = 'id';
  static const String _nome = 'nome';
  static const String _numeroConta = 'numero_conta';

  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_nome TEXT, '
      '$_numeroConta INTEGER)';

  Future<int> save(Contato contato) async {
    final Database db = await getDatabase();
    Map<String, dynamic> mapaContato = _toMap(contato);
    return db.insert(_tableName, mapaContato);
  }

  Map<String, dynamic> _toMap(Contato contato) {
    final Map<String, dynamic> mapaContato = {};
    mapaContato[_nome] = contato.nome;
    mapaContato[_numeroConta] = contato.numeroConta;
    return mapaContato;
  }

  Future<List<Contato>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> registros = await db.query(_tableName);
    List<Contato> contatos = _toList(registros);
    return contatos;
  }

  List<Contato> _toList(List<Map<String, dynamic>> registros) {
    final List<Contato> contatos = [];
    for (Map<String, dynamic> registro in registros) {
      final Contato contato = Contato(
        registro[_id],
        registro[_nome],
        registro[_numeroConta],
      );
      contatos.add(contato);
    }
    return contatos;
  }
}