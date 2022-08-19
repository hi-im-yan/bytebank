import 'package:bytebank/screens/contato/lista_contatos.dart';
import 'package:bytebank/screens/transferencia/lista_transferencia.dart';
import 'package:flutter/material.dart';

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  color: Colors.orangeAccent,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const ListaContatos()));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      height: 100,
                      width: 150,
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
                            style: TextStyle(color: Colors.white, fontSize: 16.0),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  color: Colors.orangeAccent,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => ListaTransferencia()));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      height: 100,
                      width: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Icon(
                            Icons.attach_money_rounded,
                            color: Colors.white,
                            size: 24.0,
                          ),
                          Text(
                            'Transferências',
                            style: TextStyle(color: Colors.white, fontSize: 16.0),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),

        ],
      ),
    );
  }
}
