
import 'dart:async';

import 'package:cidenet_test/models/user.dart';

class LoginBloc{

  final _user = StreamController<User>.broadcast();

  Stream<User> get user => _user.stream;

  Function(User) get changeValuesUser => _user.sink.add;
   

void dispose() { 
    
    _user.close();        
  }
}