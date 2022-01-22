import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  //Síntomas
  'sin': Icons.report_gmailerrorred,
};

Icon getIcon(String nombreIcono) {
  return Icon(_icons[nombreIcono], color: Colors.deepPurpleAccent);
}
