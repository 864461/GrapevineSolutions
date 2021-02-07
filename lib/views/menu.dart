import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grapevine_solutions/theme/AppRoutes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../theme/auth.dart';
import '';

class menuScreen extends StatefulWidget {
  menuScreen({this.auth,this.onSignedOut});
  final BaseAuth auth;
  final VoidCallback onSignedOut;


  @override _MenuViewState createState() => _MenuViewState();
}

class _MenuViewState extends State<menuScreen> {
  // final _formKey = GlobalKey<FormState>();

  // @override
  // Widget build(BuildContext context) {
    // final mq = MediaQuery.of(context);
    //
    // final loginButton = Material(
    //   elevation: 5.0,
    //   borderRadius: BorderRadius.circular((25.0)),
    //   color: Colors.white,
    //   child: MaterialButton(
    //     minWidth: mq.size.width / 1.2,
    //     padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
    //     child: Text(
    //       "Log Out",
    //       textAlign: TextAlign.center,
    //       style: TextStyle(
    //         fontSize: 20.0,
    //         color: Colors.black,
    //         fontWeight: FontWeight.bold,
    //       ),
    //     ),
    //     onPressed: () async {
    //       try {
    //          await widget.auth.signOut();
    //         widget.onSignedOut();
    //       } catch (e) {
    //         print(e);
    //       }
    //
    //       //Todo
    //       // print('Login Pressed');
    //     },
    //   ),
    // );
    //
    // final bottom = Column(
    //   mainAxisAlignment: MainAxisAlignment.start,
    //   crossAxisAlignment: CrossAxisAlignment.stretch,
    //   children: <Widget>[
    //     loginButton,
    //     Padding(
    //       padding: EdgeInsets.all(8.0),
    //     ),
    //   ],
    // );
    //
    // return Scaffold(
    //   backgroundColor: Colors.white,
    //   body: Form(
    //     key: _formKey,
    //     child: SingleChildScrollView(
    //         padding: EdgeInsets.all(36),
    //         child: Container(
    //             height: mq.size.height,
    //             child: Column(
    //               mainAxisAlignment: MainAxisAlignment.spaceAround,
    //               children: <Widget>[
    //                 Padding(
    //                   padding: EdgeInsets.only(bottom: 70),
    //                   child: bottom,
    //                 ),
    //               ],
    //             ))),
    //   ),
    // );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),


      ),
      bottomNavigationBar: BottomNavigationBar(
        // currentIndex: _currentIndex,
        // onTap: (int index) {
        //   setState(() {
        //     _currentIndex = index;
        //   });
        // },
        // currentIndex: 0, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            backgroundColor: Colors.black,
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            backgroundColor: Colors.black,
            label: 'My Shifts',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              backgroundColor: Colors.black,
              label:'Search Shifts'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              backgroundColor: Colors.black,
              label: 'Settings')
        ],
      ),
    );
  }
}
