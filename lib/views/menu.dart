import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grapevine_solutions/theme/AppRoutes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../theme/auth.dart';
import 'package:grapevine_solutions/views/home_screen.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import '';

class menuScreen extends StatefulWidget {
  menuScreen({this.auth,this.onSignedOut});
  final BaseAuth auth;
  final VoidCallback onSignedOut;


  @override _MenuViewState createState() => _MenuViewState();


}

class _MenuViewState extends State<menuScreen> {
  int _currentIndex = 0;
  final int defaultSelectedIndex = 0;
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
    //     },
    //   ),
    // );


  final List<Widget>_children =[
       Homepage(),
       Center(child: Text('Shifts')),
       Center(child: Text('Search Shifts')),
       Center(child: Text('Settings')),

  ];


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            backgroundColor: Colors.red,
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            backgroundColor: Colors.red,
            label: 'My Shifts',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              backgroundColor: Colors.red,
              label:'Search Shifts'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              backgroundColor: Colors.red,
              label: 'Settings')
        ],
      ),
    );
  }
}
