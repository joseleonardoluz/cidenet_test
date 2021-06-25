import 'package:cidenet_test/pages/edit_user_page.dart';
import 'package:cidenet_test/pages/home_page.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  
  'homepage':  (_) => HomePage(),
  'editUserPage'   :  ( _ ) => EditUserPage()
  
};