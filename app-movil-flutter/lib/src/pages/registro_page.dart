import 'package:app_qr/src/pages/login/login_bloc.dart';
import 'package:app_qr/src/pages/login/provider.dart';
import 'package:app_qr/src/provider/usuario_provider.dart';
import 'package:app_qr/src/utils/utils.dart';

import 'package:flutter/material.dart';

class RegistroPage extends StatelessWidget {
  static final String routeName = 'registro';
  final usuarioProvider = new UsuarioProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => Navigator.pushReplacementNamed(context, 'homeLogin'),
          label: const Text('Inicio'),
          icon: const Icon(Icons.bungalow),
          backgroundColor: Colors.blue.shade900,
        ),
        body: Stack(
          children: <Widget>[
            _crearFondo(context),
            _loginForm(context),
          ],
        ));
  }

  Widget _loginForm(BuildContext context) {
    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 180.0,
            ),
          ),
          Container(
            width: size.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 30.0),
            padding: EdgeInsets.symmetric(vertical: 50.0),
            decoration: BoxDecoration(
                color: Colors.indigo.shade50,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 3.0,
                      offset: Offset(0.0, 5.0),
                      spreadRadius: 3.0)
                ]),
            child: Column(
              children: <Widget>[
                Text('Crear nueva cuenta',
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
                SizedBox(height: 40.0),
                _crearEmail(bloc),
                SizedBox(height: 30.0),
                _crearPassword(bloc),
                SizedBox(height: 30.0),
                _crearBoton(bloc)
              ],
            ),
          ),
          /*  FlatButton(
            child: Text('Regresar al Login'),
            onPressed: () => Navigator.pushReplacementNamed(context, 'login'),
          ),
          SizedBox(height: 20.0), */

          MaterialButton(
            minWidth: 200.0,
            height: 50.0,
            elevation: 3,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(26),
                side: BorderSide(color: Colors.indigoAccent.shade700)),
            onPressed: () => Navigator.pushReplacementNamed(context, 'login'),
            color: Colors.lightBlue.shade900,
            child: Text('Ir al Login', style: TextStyle(color: Colors.white)),
          ),
          SizedBox(height: 100.0),

          /* TextButton(
            style: TextButton.styleFrom(
              primary: Colors.deepPurple,
              onSurface: Colors.red,
            ),
            onPressed: () =>
                Navigator.pushReplacementNamed(context, 'homeLogin'),
            child: Text('Regresar al inicio',
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 100.0), */
        ],
      ),
    );
  }

  Widget _crearEmail(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                icon: Icon(Icons.alternate_email, color: Colors.indigo),
                hintText: 'nombre@correo.com',
                labelText: 'Ingresa tu correo',
                counterText: snapshot.data,
                errorText: snapshot.error?.toString()),
            onChanged: bloc.changeEmail,
          ),
        );
      },
    );
  }

  Widget _crearPassword(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
                icon: Icon(Icons.lock_outline, color: Colors.indigo),
                hintText: '***********',
                labelText: 'Contraseña',
                counterText: snapshot.data,
                errorText: snapshot.error?.toString()),
            onChanged: bloc.changePassword,
          ),
        );
      },
    );
  }

  Widget _crearBoton(LoginBloc bloc) {
    // formValidStream
    // snapshot.hasData
    //  true ? algo si true : algo si false

    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return RaisedButton(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
              child: Text('Registrar'),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            elevation: 0.0,
            color: Colors.indigo.shade900,
            textColor: Colors.white,
            onPressed:
                snapshot.hasData ? () => _register(bloc, context) : null);
      },
    );
  }

  _register(LoginBloc bloc, BuildContext context) async {
    usuarioProvider.nuevoUsuario(bloc.email, bloc.password);
    final info = await usuarioProvider.nuevoUsuario(bloc.email, bloc.password);

    if (info['ok']) {
      Navigator.pushReplacementNamed(context, 'usuario');
    } else {
      mostrarAlerta(context, info['mensaje']);
    }
    // Navigator.pushReplacementNamed(context, 'home');
  }

  Widget _crearFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final fondoModaro = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/menu-img1.png'), fit: BoxFit.cover)),
    );

    final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Color.fromRGBO(255, 255, 255, 0.05)),
    );

    return Stack(
      children: <Widget>[
        fondoModaro,
        Positioned(top: 90.0, left: 30.0, child: circulo),
        Positioned(top: -40.0, right: -30.0, child: circulo),
        Positioned(bottom: -50.0, right: -10.0, child: circulo),
        Positioned(bottom: 120.0, right: 20.0, child: circulo),
        Positioned(bottom: -50.0, left: -20.0, child: circulo),
        Container(
          padding: EdgeInsets.only(top: 70.0),
          child: Column(
            children: <Widget>[
              Icon(Icons.supervisor_account_sharp,
                  color: Colors.white, size: 70.0),
              SizedBox(height: 10.0, width: double.infinity),
              Text('REGISTRO',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold))
            ],
          ),
        )
      ],
    );
  }
}
