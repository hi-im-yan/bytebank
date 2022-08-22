import 'package:bytebank/http/webclient.dart';
import 'package:bytebank/models/contato.dart';
import 'package:bytebank/screens/dashboard.dart';
import 'package:bytebank/screens/formulario_contato.dart';
import 'package:bytebank/screens/lista_contatos.dart';
import 'package:bytebank/screens/lista_transferencia.dart';
import 'package:flutter/material.dart';

import 'database/app_database.dart';

void main() {
  runApp(const BytebankApp());
  // findAll().then((contatos) => debugPrint(contatos.toString()));
  Webclient webclient = Webclient();
  webclient.findAll();
}

class BytebankApp extends StatelessWidget {
  const BytebankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.green[900],
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.cyan),
          ),
        ),
      ),
      home: Dashboard(),
    );
  }
}



// home: ListaTransferencia(),
