import 'package:flutter/material.dart';
import 'package:grapevine_solutions/views/login_screen.dart';
import 'package:grapevine_solutions/views/register_screen.dart';
import 'package:grapevine_solutions/views/menu.dart';
import 'auth.dart';

class AppRoutes{
  AppRoutes._();

  static const String authLogin = '/auth-Login';
  static const String authRegister = '/auth-register';
  static const String authMenu = '/auth-menu';

  static Map<String, WidgetBuilder> define() {
    return {
      authLogin: (context) => Login(auth: new Auth()),
      authRegister: (context) => Register(auth: new Auth()),
      authMenu: (context) => menuScreen(),
    };
  }
}