import 'package:flutter/material.dart';

class ListaContatos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contatos'),
      ),
      body: ListView(
        children: const [
          Card(
            child: ListTile(
              title: Text(
                'Yan',
                style: TextStyle(fontSize: 24.0),
              ),
              subtitle: Text('1000', style: TextStyle(fontSize: 16.0)),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
