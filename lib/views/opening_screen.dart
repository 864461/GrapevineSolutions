import 'package:flutter/material.dart';
import 'package:grapevine_solutions/theme/AppRoutes.dart';
import '../theme/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OpeningView extends StatelessWidget{

  OpeningView({this.auth,this.onSignedIn});
  final BaseAuth auth;
  final VoidCallback onSignedIn;

  @override
  Widget build(BuildContext context){
    final mq = MediaQuery.of(context);

    final logo = Image.asset(
      "logo7.jpeg",
      //fit: BoxFit.scaleDown
      height: mq.size.height / 2,
    );

    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular((25.0)),
      color: Colors.white,
      child: MaterialButton(
        minWidth: mq.size.width / 1.2,
        padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
        child: Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.authLogin);
          // print('Login Pressed');
        },
      ),
    );

    final registerButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular((25.0)),
      color: Colors.white,
      child: MaterialButton(
        minWidth: mq.size.width / 1.2,
        padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
        child: Text(
          "Register",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.authRegister);
          print('Register Pressed');
        },
      ),
    );

    final buttons = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        loginButton,
        Padding(
          padding: EdgeInsets.fromLTRB(0, 15, 0, 75),
          child: registerButton,
        ),
      ],
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
          padding: EdgeInsets.all(36),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: logo,
              ),
              buttons
            ],
          )),
    );
  }
}