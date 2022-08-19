import 'package:bytebank/models/contato.dart';
import 'package:bytebank/screens/formulario_contato.dart';
import 'package:flutter/material.dart';

import '../database/dao/contato_dao.dart';

class ListaContatos extends StatefulWidget {
  const ListaContatos({Key? key}) : super(key: key);

  @override
  State<ListaContatos> createState() => _ListaContatosState();
}

class _ListaContatosState extends State<ListaContatos> {
  final ContatoDAO _dao = ContatoDAO();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contatos'),
      ),
      body: FutureBuilder<List<Contato>>(
        future: Future.delayed(const Duration(seconds: 1))
            .then((value) => _dao.findAll()),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;

            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(),
                    Text('Carregando')
                  ],
                ),
              );

            case ConnectionState.active:
              break;

            case ConnectionState.done:
              List<Contato> contatos = snapshot.data;
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  final Contato contato = contatos[index];
                  return _ItemContato(contato: contato);
                },
                itemCount: contatos.length,
              );
          }
          return const Text(
              'Erro desconhecido durante carregamento de contatos');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const FormularioContato()),
          ).then((value) {
            setState(() {
              //forçar atualização dos dados
            });
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _ItemContato extends StatelessWidget {
  final Contato contato;

  const _ItemContato({super.key, required this.contato});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          contato.nome,
          style: const TextStyle(fontSize: 24.0),
        ),
        subtitle: Text(contato.numeroConta.toString(),
            style: const TextStyle(fontSize: 16.0)),
      ),
    );
  }
}
