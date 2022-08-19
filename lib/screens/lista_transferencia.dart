import 'package:flutter/material.dart';

import '../models/transferencia.dart';
import 'formularo_transferencia.dart';

const _tituloAppBar = 'Transferências';

class ListaTransferencia extends StatefulWidget {
  final List<Transferencia> _transferencias = [];

  ListaTransferencia({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciaState();
  }
}

class ListaTransferenciaState extends State<ListaTransferencia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_tituloAppBar),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, index) {
          final transferencia = widget._transferencias[index];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: ElevatedButton(
        child: const Icon(Icons.add),
        onPressed: () {
          final Future future =
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const FormularioTransferencia();
          }));
          future.then((transferenciaRecebida) {
            if (transferenciaRecebida != null) {
              setState(() => widget._transferencias.add(transferenciaRecebida));
            }
          });
        },
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  const ItemTransferencia(this._transferencia, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text('R\$ ${_transferencia.valor}'),
        subtitle:
        Text('Transferido para: ${_transferencia.numeroConta}'),
      ),
    );
  }
}