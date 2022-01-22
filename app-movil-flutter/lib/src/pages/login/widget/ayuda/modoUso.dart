import 'package:flutter/material.dart';

import 'package:app_qr/src/widgets/menu_widget.dart';

class ModoUsoLogin extends StatelessWidget {
  static final String routeName = 'modoUsoLogin';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                  icon: const Icon(Icons.reply_sharp),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'homeLogin');
                  });
            },
          ),
          title: Text(
            'Modo de Uso',
          ),
          backgroundColor: Colors.deepPurple,
        ),
        body: ListView(
          children: [
            // Imagen

            Image(image: AssetImage('assets/covid-home.png')),
            Text(
              'MODO DE USO',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                fontFamily: 'Kanit',
              ),
            ),

            Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  'PASO 1: Para poder usar esta aplicación es necesario que te registres con tu correo institucional brindado por el TESE, por consiguiente, debes de iniciar sesión para poder entrar. ',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontFamily: 'Kanit'),
                )),

            Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  'PASO 2: Para poder utilizar esta aplicación se deberá ingresar en la pestaña de carrera, esto con la finalidad de escanear un código que almacenara los datos de tu división y salón ',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontFamily: 'Kanit'),
                )),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  'PASO 3: Una vez que se registró tu grupo, deberás ingresar a la opción síntomas, donde seleccionaras la opción que desgloso tu encuesta hecha por la universidad. ',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontFamily: 'Kanit'),
                )),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  'NOTA: la información se almacena directamente en la base de datos después de leer el código QR',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontFamily: 'Kanit'),
                )),
          ],
        ));
  }
}
