import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider {
  List<dynamic> opciones = [];

  Future<List<dynamic>> cargarDatos() async {
    final resp = await rootBundle.loadString('data/menu_opts.json');
    Map dataMap = jsonDecode(resp);
    print(dataMap);
    print(dataMap['rutas']);
    opciones = dataMap['rutas'];
    return opciones;
  }
}

final menuProvider = new _MenuProvider();
