import 'package:flutter/material.dart';
import 'package:grapevine_solutions/views/login_screen.dart';
import 'package:grapevine_solutions/views/register_screen.dart';
import 'package:grapevine_solutions/views/menu.dart';
import 'package:grapevine_solutions/views/provider.dart';
import 'auth.dart';
import 'package:grapevine_solutions/theme/root_page.dart';

class AppRoutes{
  AppRoutes._();

  static const String authLogin = '/auth-Login';
  static const String authRegister = '/auth-register';
  static const String authMenu = '/auth-menu';

  static Map<String, WidgetBuilder> define() {
    return {
      authLogin: (context) => Login(),
      authRegister: (context) => Register(),
      authMenu: (context) => menuScreen(),
    };
  }
}