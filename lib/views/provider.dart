import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../theme/auth.dart';

class Provider extends InheritedWidget {
  // Provider({this.auth,this.onSignedIn});
  final BaseAuth auth;

  Provider({Key key, Widget child, this.auth}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static Provider of(BuildContext context) =>  context.dependOnInheritedWidgetOfExactType<Provider>();
      // (context.inheritFromWidgetOfExactType(Provider) as Provider);

}
//Provider.of(context).auth;