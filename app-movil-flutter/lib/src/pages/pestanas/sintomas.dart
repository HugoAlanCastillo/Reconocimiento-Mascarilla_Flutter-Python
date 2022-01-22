import 'package:flutter/material.dart';
import 'package:app_qr/src/widgets/menu_widget1.dart';

class SintomasPage extends StatelessWidget {
  static final String routeName = 'sintomas';
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sintomas'),
          backgroundColor: Colors.deepPurple,
        ),
        drawer: MenuWidget1(),
        body: ListView(
          children: <Widget>[
            // Imagen

            Image(image: AssetImage('assets/covid-home.png')),

            Container(
                margin: EdgeInsets.symmetric(horizontal: 60, vertical: 5),
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 11.0),
                child: Text(
                  'Eliga la opción deseada',
                  style: TextStyle(fontSize: 15, fontFamily: 'Kanit'),
                )),

            // Button Section
            //Button(),

            // Description
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
                    child: Text('Calendario',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  elevation: 1.0,
                  color: Colors.green,
                  textColor: Colors.white,
                  onPressed: () => _Saludable(context),
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
                        EdgeInsets.symmetric(horizontal: 80.0, vertical: 14.0),
                    child: Text('Infectado',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  elevation: 1.0,
                  color: Colors.red,
                  textColor: Colors.white,
                  onPressed: () => _Infected(context),
                ),
              ],
            ),
            SizedBox(height: 100.0)
            /* Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
                    child: Text('Infectado'),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  elevation: 0.0,
                  color: Colors.red,
                  textColor: Colors.white,
                  onPressed: () => _Infected(context),
                ),
              ],
            ), */
          ],
        ));
  }

  void _Saludable(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Saludable',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          backgroundColor: Color(0xFFB0F6CA).withOpacity(1),
          content: Text(
            'La información ha sido almacenada y guardada. ',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Salir'),
              onPressed: () {
                Navigator.of(context).pop('ok');
              },
            ),
          ],
        );
      },
    );
  }

  void _Riesconta(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Riesgo de contagio',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          backgroundColor: Color(0xFFFFCC80).withOpacity(1),
          content: Text(
            'La información ha sido almacenada y guardada. ',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Salir'),
              onPressed: () {
                Navigator.of(context).pop('ok');
              },
            ),
          ],
        );
      },
    );
  }

  void _Infected(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Infectado',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          backgroundColor: Color(0XFFFFCDD2).withOpacity(1),
          content: Text(
            'La información ha sido almacenada y guardada. ',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Salir'),
              onPressed: () {
                Navigator.of(context).pop('ok');
              },
            ),
          ],
        );
      },
    );
  }
}
