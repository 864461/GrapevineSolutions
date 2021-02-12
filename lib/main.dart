import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grapevine_solutions/views/home_screen.dart';
import 'package:grapevine_solutions/theme/AppRoutes.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:grapevine_solutions/theme/auth.dart';
import 'package:grapevine_solutions/theme/root_page.dart';
import 'package:grapevine_solutions/views/provider.dart';

    void main() async{
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();
      runApp(new MyApp());
    }

    DatabaseReference usersRef = FirebaseDatabase.instance.reference().child("users");

    class MyApp extends StatelessWidget{
      @override
        Widget build(BuildContext context) {
          return Provider(
            auth:Auth(),
            child: MaterialApp(
            title: 'OpeningScreen',
            routes: AppRoutes.define(),
            home: RootPage())
          );
        }
    }



