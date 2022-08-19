import 'package:flutter/material.dart';

import '../../components/editor.dart';
import '../../database/dao/contato_dao.dart';
import '../../models/contato.dart';

class AtualizaContato extends StatelessWidget {
  final Contato contatoParaAtualizar;

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _numeroContaController = TextEditingController();
  final ContatoDAO _dao = ContatoDAO();

  AtualizaContato({super.key, required this.contatoParaAtualizar});

  @override
  Widget build(BuildContext context) {
    debugPrint(contatoParaAtualizar.toString());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo contato'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Editor(
                controller: _nomeController,
                label: 'Nome',
                keyboarType: TextInputType.text,
                fontSize: 24.0,
                hint: contatoParaAtualizar.nome,
              ),
              Editor(
                controller: _numeroContaController,
                label: 'Número da conta',
                keyboarType: TextInputType.number,
                fontSize: 24.0,
                hint: contatoParaAtualizar.numeroConta.toString(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: () => {
                      contatoParaAtualizar.
                    },
                    child: const Text('ATUALIZAR'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
