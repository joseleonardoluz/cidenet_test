
import 'package:cidenet_test/bloc/login_bloc.dart';
import 'package:flutter/material.dart';

class Provider extends InheritedWidget {

  final loginBloc = LoginBloc();
  
  Provider({
    Key key,
    Widget child,
  }): super(key: key, child: child);

  static LoginBloc of(BuildContext context) {
    return  context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc;
  }

  @override
  bool updateShouldNotify(Provider oldWidget) => true;
}