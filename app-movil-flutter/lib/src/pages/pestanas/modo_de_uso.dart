import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:app_qr/src/widgets/menu_widget.dart';

class Modo_de_usoPage extends StatelessWidget {
  static final String routeName = 'uso';

  @override
  Widget build(BuildContext context) {
    void _showSnack() => ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Notificaciones Descativadas'),
            duration: Duration(milliseconds: 500),
            backgroundColor: Colors.red,
          ),
        );

    void _showToast() => Fluttertoast.showToast(
          msg: 'Notificaciones Activadas',
          toastLength: Toast.LENGTH_SHORT,
        );

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Notificación',
          ),
          backgroundColor: Colors.deepPurple,
        ),
        drawer: MenuWidget(),
        body: ListView(
          children: <Widget>[
            // Imagen

            Image(image: AssetImage('assets/covid-home.png')),

            Container(
                margin: EdgeInsets.symmetric(horizontal: 60, vertical: 5),
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 11.0),
                child: Text(
                  'Activa o desactiva las notificaciones',
                  style: TextStyle(fontSize: 15, fontFamily: 'Kanit'),
                )),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 60.0, vertical: 15.0),
                    child: Text('Activar Notificaciones',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  elevation: 1.0,
                  color: Colors.green,
                  textColor: Colors.white,
                  onPressed: _showToast,
                ),
              ],
            ),
            SizedBox(height: 10.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
                    child: Text('Desactivar Notificaciones',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  elevation: 1.0,
                  color: Colors.red,
                  textColor: Colors.white,
                  onPressed: _showSnack,
                ),
              ],
            ),
          ],
        ));
  }
}
