import 'package:flutter/material.dart';
import 'package:grapevine_solutions/views/login_screen.dart';
import 'package:grapevine_solutions/views/opening_screen.dart';
import 'auth.dart';
import 'AppRoutes.dart';
import 'package:grapevine_solutions/views/menu.dart';

class RootPage extends StatefulWidget {
  RootPage({this.auth});
  final BaseAuth auth;

  @override
  State<StatefulWidget> createState() => new _RootPageState();
}

enum AuthStatus { notSignedIn, signedIn }

class _RootPageState extends State<RootPage> {
  AuthStatus authStatus = AuthStatus.notSignedIn;

  @override
  void initState() {
    super.initState();
    widget.auth.currentUser().then((userId) {
      setState(() {
        authStatus = userId == null ? AuthStatus.notSignedIn : AuthStatus.signedIn;
      });
    });

  }

  void _signedIn() {
    setState(() {
      authStatus = AuthStatus.signedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.notSignedIn:
        return new Login(
          auth: widget.auth,
          onSignedIn: _signedIn,
        );
      case AuthStatus.signedIn:
        // Navigator.of(context).pushNamed(AppRoutes.authMenu);
        return new menuScreen(auth: widget.auth);
    }
  }
}


