import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


abstract class BaseAuth {
  Future<String> signInWithEmailAndPassword(String email, String password);
  Future<String> createUserWithEmailAndPassword(String email, String password);
  Future<String> currentUserUid();
  Future<void> signOut();
  Future currentUser();
  // Future getCurrentUser();
}

class Auth implements BaseAuth {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> signInWithEmailAndPassword(
      String email, String password) async {
    User user = (await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    ))
        .user;
    return user.uid;
  }

  Future<String> createUserWithEmailAndPassword(
      String email, String password) async {
    User user = (await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    ))
        .user;
    return user.uid;
  }


  Future<String> currentUserUid() async{
    // User user = (await FirebaseAuth.instance.currentUser());
    User user;
    FirebaseAuth.instance.authStateChanges().listen((User user) {
        user = user ;
    });
    // print("currentUser running :" + user.uid);
    return user.uid;

  }

  // Future getCurrentUser() async {
  //    User user = await _firebaseAuth.currentUser();
  //  return user;
  // }


  Future currentUser() async{
    // User user = (await FirebaseAuth.instance.currentUser());
    User user;
    FirebaseAuth.instance.authStateChanges().listen((User user) {
      user = user ;
    });
    // print("currentUser running :" + user.uid);
    return user;

  }





  Future<void> signOut() async {
    return FirebaseAuth.instance.signOut();
  }

}
