import 'package:app_qr/src/pages/login/widget/constant.dart';
import 'package:flutter/material.dart';

class WelcomeBack extends StatelessWidget {
  const WelcomeBack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Text(
        'Saliendo...',
        style: TextStyle(
          color: mPrimaryTextColor,
          fontSize: 32,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
