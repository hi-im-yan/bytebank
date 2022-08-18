import 'package:bytebank/components/editor.dart';
import 'package:flutter/material.dart';

class FormularioContato extends StatelessWidget {
  FormularioContato({Key? key}) : super(key: key);

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _numeroContaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              ),
              Editor(
                controller: _numeroContaController,
                label: 'Conta',
                keyboarType: TextInputType.number,
                fontSize: 24.0,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('SALVAR'),
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