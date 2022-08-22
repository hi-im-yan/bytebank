import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  final String message;
  const Loading({this.message = 'carregando'});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          Text(widget.message),
        ],
      ),
    );;
  }
}
