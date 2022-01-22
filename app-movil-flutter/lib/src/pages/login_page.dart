import 'package:flutter/material.dart';
import 'package:app_qr/src/pages/login/provider.dart';
import 'package:app_qr/src/provider/usuario_provider.dart';
import 'package:app_qr/src/utils/utils.dart';

class LoginPage extends StatelessWidget {
  static final String routeName = 'login';
  final usuarioProvider = new UsuarioProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => Navigator.pushReplacementNamed(context, 'homeLogin'),
          label: const Text('Inicio'),
          icon: const Icon(Icons.bungalow),
          backgroundColor: Colors.deepPurple.shade300,
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
                color: Colors.deepPurple.shade50,
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
                Text('Ingresa tus datos',
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
          //
          /*  FlatButton(
            child: Text('Crear una nueva cuenta'),
            onPressed: () =>
                Navigator.pushReplacementNamed(context, 'registro'),
          ),
          FlatButton(
            child: Text('¿Olvidaste tu contraseña?'),
            onPressed: () =>
                Navigator.pushReplacementNamed(context, 'registro'),
          ),

          SizedBox(height: 20.0),
         
         */
          MaterialButton(
            minWidth: 200.0,
            height: 50.0,
            elevation: 3,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(36),
                side: BorderSide(color: Colors.deepPurple.shade200)),
            onPressed: () =>
                Navigator.pushReplacementNamed(context, 'registro'),
            color: Colors.deepPurple.shade600,
            child: Text('Crear Cuenta', style: TextStyle(color: Colors.white)),
          ),
          SizedBox(height: 15.0),

          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.deepPurple,
              onSurface: Colors.red,
            ),
            onPressed: () {
              /* =>
                Navigator.pushReplacementNamed(context, 'homeLogin'), */
            },
            child: Text('¿Olvidaste tu contraseña?',
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold)),
          ),

          SizedBox(height: 100.0),

          /*  FlatButton(
                padding:
                    const EdgeInsets.symmetric(horizontal: 3, vertical: 2),

                   shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                    side: BorderSide(color: Colors.deepPurple.shade200)),
          
                color: Colors.deepPurple.shade600,
              
                onPressed: () {
                  /* =>
                    Navigator.pushReplacementNamed(context, 'registro'), */
                },
             
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: Text(
                    '¿Contraseña?',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
             */
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
                icon: Icon(Icons.alternate_email, color: Colors.deepPurple),
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
                icon: Icon(Icons.lock_outline, color: Colors.deepPurple),
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
              child: Text('Acceder'),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            elevation: 0.0,
            color: Colors.deepPurple,
            textColor: Colors.white,
            onPressed: snapshot.hasData ? () => _login(bloc, context) : null);
      },
    );
  }

  _login(LoginBloc bloc, BuildContext context) async {
    Map info = await usuarioProvider.login(bloc.email, bloc.password);

    if (info['ok']) {
      Navigator.pushReplacementNamed(context, 'usuario');
    } else {
      mostrarAlerta(context, info['mensaje']);
    }
  }

  Widget _crearFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final fondoModaro = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/menu-img.jpg'), fit: BoxFit.cover)),
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
              Icon(Icons.person, color: Colors.white, size: 70.0),
              SizedBox(height: 10.0, width: double.infinity),
              Text('ACCESO',
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
