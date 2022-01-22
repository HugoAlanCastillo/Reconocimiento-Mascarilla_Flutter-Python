import 'package:flutter/material.dart';
//Home
import 'package:app_qr/src/pages/home_page.dart';
/* import 'package:app_qr/src/pages/home_temp2.dart'; */
//Login
import 'package:app_qr/src/pages/login/provider.dart';
import 'package:app_qr/src/pages/login_page.dart';
import 'package:app_qr/src/pages/registro_page.dart';
import 'package:app_qr/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:app_qr/src/pages/login/splash/splash_screen.dart';
import 'package:app_qr/src/pages/login/home_screen.dart';

//Pestañas
import 'package:app_qr/src/pages/pestanas/carrera.dart';
import 'package:app_qr/src/pages/pestanas/contacto.dart';
import 'package:app_qr/src/pages/pestanas/modo_de_uso.dart';
import 'package:app_qr/src/pages/pestanas/noti.dart';
import 'package:app_qr/src/pages/pestanas/sintomas.dart';
import 'package:app_qr/src/pages/pestanas/usuario.dart';
import 'package:app_qr/src/pages/login/widget/ayuda/contact.dart';
import 'package:app_qr/src/pages/login/widget/ayuda/modoUso.dart';

//firebase
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prefs = new PreferenciasUsuario();
    print(prefs.token);

    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Detector Mascarilla',
        initialRoute: 'inicio',
        routes: {
          //Drawer
          HomePage.routeName: (BuildContext context) => HomePage(),
          ContactoPage.routeName: (BuildContext context) => ContactoPage(),
          UsuarioPage.routeName: (BuildContext context) => UsuarioPage(),
          Modo_de_usoPage.routeName: (BuildContext context) =>
              Modo_de_usoPage(),

          //Inicio
          'carrera': (BuildContext context) => HomePage1(),
          'noti': (BuildContext conbtext) => NotiPage(),
          'sintomas': (BuildContext context) => SintomasPage(),

          //Login
          'login': (BuildContext context) => LoginPage(),
          'usuario': (BuildContext context) => UsuarioPage(),
          'registro': (BuildContext context) => RegistroPage(),
          'homeLogin': (BuildContext context) => HomeScreen(),
          'inicio': (BuildContext context) => SplashScreen(),

          //Ayuda
          'contactoLogin': (BuildContext context) => ContactoLogin(),
          'modoUsoLogin': (BuildContext context) => ModoUsoLogin(),

          //Notificación
        },
        theme: ThemeData(
          primaryColor: Colors.deepPurple,
        ),
      ),
    );
  }
}
