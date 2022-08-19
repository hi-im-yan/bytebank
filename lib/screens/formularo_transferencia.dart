import 'package:flutter/material.dart';

import '../components/editor.dart';
import '../models/transferencia.dart';

const _tituloAppBar = 'Criando transferência';
const _labelCampoValor = 'Valor da transferência';
const _labelCampoConta = 'Número da conta';
const _buttonSubmitText = 'confirmar';
const _hintCampoConta = '0000';
const _hintCampoValor = '0.00';

class FormularioTransferencia extends StatefulWidget {
  const FormularioTransferencia({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _numeroContaController = TextEditingController();
  final TextEditingController _valorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(_tituloAppBar),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Editor(
                controller: _numeroContaController,
                label: _labelCampoConta,
                keyboarType: TextInputType.number,
                hint: _hintCampoConta,
              ),
              Editor(
                controller: _valorController,
                label: _labelCampoValor,
                keyboarType: TextInputType.number,
                hint: _hintCampoValor,
                icon: Icons.monetization_on,
              ),
              ElevatedButton(
                onPressed: () => _criaTransferencia(context),
                child: const Text(_buttonSubmitText),
              )
            ],
          ),
        ));
  }

  void _criaTransferencia(BuildContext context) {
    final int? numeroConta = int.tryParse(_numeroContaController.text);
    final double? valor = double.tryParse(_valorController.text);

    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);

      Navigator.pop(context, transferenciaCriada);
    }
  }
}