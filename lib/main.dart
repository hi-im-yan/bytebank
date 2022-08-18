import 'package:bytebank/screens/lista_transferencia.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BytebankApp());
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
      home: const Dashboard(),
    );
  }
}

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('images/bytebank_logo.jpeg'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              height: 100,
              width: 150,
              color: Colors.orangeAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Icon(
                    Icons.people,
                    color: Colors.white,
                    size: 24.0,
                  ),
                  Text(
                    'Contatos',
                    style: TextStyle(color: Colors.white,fontSize: 16.0),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

// home: ListaTransferencia(),
