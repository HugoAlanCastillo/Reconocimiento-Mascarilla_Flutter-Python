import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  //Notificación
  'add_alert': Icons.add_alert,
  //Usuario
  'accessibility': Icons.accessibility,
  //Síntomas
  'sin': Icons.report_gmailerrorred,
  'agenda': Icons.view_agenda,
  //Contacto
  'mail': Icons.contact_mail,
  //Modo de Uso
  'modo': Icons.info,
  //Carrera
  'edifi': Icons.business,
};

Icon getIcon(String nombreIcono) {
  return Icon(_icons[nombreIcono], color: Colors.deepPurpleAccent);
}
