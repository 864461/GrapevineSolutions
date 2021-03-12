import 'package:flutter/material.dart';
import 'package:grapevine_solutions/views/login_screen.dart';
import 'package:grapevine_solutions/views/register_screen.dart';
import 'package:grapevine_solutions/views/home_screen.dart';
import 'package:grapevine_solutions/views/provider.dart';
import 'auth.dart';
import 'AppRoutes.dart';
import 'package:grapevine_solutions/views/menu.dart';



class RootPage extends StatefulWidget {
  // RootPage({this.auth});
  // final BaseAuth auth;

  @override
  State<StatefulWidget> createState() => new _RootPageState();
}
enum AuthStatus { notSignedIn, signedIn ,notRegistered,signedInProfile}

class _RootPageState extends State<RootPage> {
  AuthStatus authStatus = AuthStatus.notSignedIn;

  @override
  void didChangeDependecies(){
    super.didChangeDependencies();
    var auth = Provider.of(context).auth;
    auth.currentUserUid().then((userId) {
      setState(() {
        authStatus = userId == null ? AuthStatus.notSignedIn : AuthStatus.signedIn;
      });
    });
  }


  // void initState() {
  //   super.initState();
  //   widget.auth.currentUserUid().then((userId) {
  //     setState(() {
  //       authStatus = userId == null ? AuthStatus.notSignedIn : AuthStatus.signedIn;
  //     });
  //   });
  //
  // }

  void _signedIn() {
    setState(() {
      authStatus = AuthStatus.signedIn;
    });
  }

  void _signedOut() {
    setState(() {
      authStatus = AuthStatus.notSignedIn;
    });
  }
  void _notRegistered() {
    setState(() {
      authStatus = AuthStatus.notRegistered;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.notSignedIn:
        return new Login(
          onSignedIn: _signedIn,
            notRegistered: _notRegistered,
        );
      case AuthStatus.signedIn:
        // Navigator.of(context).pushNamed(AppRoutes.authMenu);
        return new menuScreen(
        onSignedOut: _signedOut,
        );
      case AuthStatus.notRegistered:
      // Navigator.of(context).pushNamed(AppRoutes.authMenu);
        return  Register(
          onRegister: _signedIn,
          onSignedIn: _signedOut,
        );
    }
  }
}


