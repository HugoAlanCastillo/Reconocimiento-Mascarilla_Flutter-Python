import 'package:flutter/material.dart';
import 'package:app_qr/src/pages/login/login_bloc.dart';
export 'package:app_qr/src/pages/login/login_bloc.dart';

class Provider extends InheritedWidget {
  Provider({Key? key, required this.child}) : super(key: key, child: child);
  final loginBloc = LoginBloc();
  final Widget child;

  static LoginBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>()!.loginBloc;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}
