import 'package:app_qr/src/pages/pestanas/contacto.dart';
import 'package:app_qr/src/pages/pestanas/modo_de_uso.dart';
import 'package:flutter/material.dart';
import 'package:app_qr/src/widgets/menu_widget.dart';
import 'package:app_qr/src/pages/login/provider.dart';

class UsuarioPage extends StatelessWidget {
  static final String routeName = 'usuario';

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Detector Mascarilla'),
        backgroundColor: Colors.deepPurple,
      ),
      drawer: MenuWidget(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 16),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
              color: Colors.indigo,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(32),
                  bottomLeft: Radius.circular(32),
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32)),
            ),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Column(
                        children: <Widget>[],
                      ),
                    ),
                    Container(
                      width: 170,
                      height: 170,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/covid-icono.png'),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Column(
                        children: <Widget>[],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 32),
                  child: Text(
                    'Bienvenido \n ${bloc.email}',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 14, right: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Icon(
                            Icons.shield,
                            color: Colors.white,
                          ),
                          Text(
                            'Protégete',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Icon(
                            Icons.coronavirus,
                            color: Colors.white,
                          ),
                          Text(
                            'Covid 19',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Icon(
                            Icons.masks,
                            color: Colors.white,
                          ),
                          Text(
                            'Usa mascarilla',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Icon(
                            Icons.favorite,
                            color: Colors.white,
                          ),
                          Text(
                            'Salud ',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 3,
            padding: EdgeInsets.all(42),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
                    child: Text('Notificación',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  elevation: 1.0,
                  color: Colors.indigo.shade200,
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, Modo_de_usoPage.routeName);
                    // Navigator.pushReplacementNamed(context, SintomasPage.routeName);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
