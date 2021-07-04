import 'package:cidenet_test/bloc/provider.dart';
import 'package:cidenet_test/routes/routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cidened',
      initialRoute: 'homepage',
      routes: appRoutes,
    ));
  }
}
