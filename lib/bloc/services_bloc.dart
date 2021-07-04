

import 'dart:async';

import 'package:cidenet_test/services/socket_service.dart';

class ServicesBloc{

  final _servicesBloc = StreamController<SocketService>.broadcast();

  Stream<SocketService> get socketService => _servicesBloc.stream;

  Function(SocketService) get changeSocketService => _servicesBloc.sink.add;

  void dispose(){
    _servicesBloc.close();
  }
}