//import 'package:app_qr/src/pages/pestanas/contacto.dart';
import 'package:app_qr/src/pages/login_page.dart';
import 'package:app_qr/src/pages/pestanas/contacto.dart';
import 'package:app_qr/src/pages/pestanas/modo_de_uso.dart';
//import 'package:app_qr/src/pages/pestanas/sintomas.dart';
import 'package:app_qr/src/pages/pestanas/usuario.dart';
import 'package:flutter/material.dart';
import 'package:app_qr/src/pages/home_page.dart';
import 'package:app_qr/src/pages/login/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';

class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Drawer(
      child: Material(
        color: Color.fromRGBO(248, 236, 252, 1),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Container(),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/menu-img.jpg'),
                    fit: BoxFit.cover),
              ),
            ),
            ListTile(
                leading: Icon(Icons.account_circle_rounded,
                    color: Colors.deepPurple.shade300),
                title: Text(
                  '${bloc.email}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.indigo.shade900),
                ),
                onTap: (null)),
            Divider(),
            ListTile(
              leading: Icon(Icons.home, color: Colors.deepPurple),
              title: Text(
                'Inicio',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              onTap: () => Navigator.pushReplacementNamed(
                  context, UsuarioPage.routeName),
            ),
            /* ListTile(
              leading: Icon(Icons.accessibility, color: Colors.deepPurple),
              title: Text(
                'Usuario',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              onTap: () => Navigator.pushReplacementNamed(
                  context, UsuarioPage.routeName),
            ), */
            ListTile(
              leading: Icon(Icons.add_alert, color: Colors.deepPurple),
              title: Text(
                'Notificación',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              onTap: () => Navigator.pushReplacementNamed(
                  context, Modo_de_usoPage.routeName),
            ),
            ListTile(
              leading: Icon(Icons.people, color: Colors.deepPurple),
              title: Text(
                'Contacto',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, ContactoPage.routeName);
                // Navigator.pushReplacementNamed(context, SintomasPage.routeName);
              },
            ),
            Divider(),
            ListTile(
                leading: Icon(Icons.door_sliding_outlined, color: Colors.red),
                title: Text(
                  'Salir',
                  style: TextStyle(
                      color: Colors.red.shade900,
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),
                onTap: () async {
                  SharedPreferences pref =
                      await SharedPreferences.getInstance();
                  await pref.clear();
                  Navigator.pushReplacementNamed(context, LoginPage.routeName);
                }),
          ],
        ),
      ),
    );
  }
}
