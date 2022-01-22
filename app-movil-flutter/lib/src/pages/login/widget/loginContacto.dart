import 'package:app_qr/src/pages/login/widget/constant.dart';
import 'package:flutter/material.dart';

class LoginContacto extends StatelessWidget {
  const LoginContacto({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(36),
            side: BorderSide(color: mFacebookColor)),
        onPressed: () {
          Navigator.pushReplacementNamed(context, 'contactoLogin');
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //SvgPicture.asset('assets/images/facebook.svg'),
              SizedBox(
                width: 12,
              ),
              Text(
                'Contacto',
                style: TextStyle(color: mFacebookColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
