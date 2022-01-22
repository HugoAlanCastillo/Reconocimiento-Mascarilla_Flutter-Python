import 'package:app_qr/src/pages/login/widget/constant.dart';
import 'package:app_qr/src/pages/login/widget/loginModoUso.dart';
import 'package:app_qr/src/pages/login/widget/login_and_register.dart';
import 'package:app_qr/src/pages/login/widget/loginContacto.dart';
import 'package:app_qr/src/pages/login/widget/slider_dot.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static final String routeName = 'homeLogin';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Image.asset('assets/covid-home2.png'),
          SliderDot(),
          SizedBox(
            height: 20,
          ),
          Text(
            'Bienvenido\n Elige una opción',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: mPrimaryTextColor,
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 60,
          ),
          LoginAndRegister(),
          Divider(),
          LoginContacto(),
          SizedBox(
            height: 10,
          ),
          LoginModoUso(),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
