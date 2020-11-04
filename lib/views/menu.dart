import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grapevine_solutions/theme/AppRoutes.dart';
import 'package:firebase_auth/firebase_auth.dart';

class menuScreen extends StatefulWidget{
  @override _MenuViewState createState() => _MenuViewState();
}

class _MenuViewState extends State<menuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Text("Home"),
    );
  }
}