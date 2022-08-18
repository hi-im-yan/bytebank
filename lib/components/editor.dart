import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final TextInputType keyboarType;
  final String? hint;
  final IconData? icon;
  final double? fontSize;

  Editor({
    required this.controller,
    required this.label,
    required this.keyboarType,
    this.hint,
    this.icon,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(fontSize: fontSize),
      decoration: InputDecoration(
        icon: icon != null ? Icon(icon) : null,
        labelText: label,
        hintText: hint,
      ),
      keyboardType: keyboarType,
    );
  }
}
