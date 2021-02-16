import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grapevine_solutions/theme/AppRoutes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../theme/auth.dart';
import 'package:grapevine_solutions/views/home_screen.dart';
import 'package:grapevine_solutions/views/shifts.dart';
import 'package:grapevine_solutions/views/Myshift.dart';
import 'package:grapevine_solutions/views/provider.dart';
import 'package:grapevine_solutions/views/setting.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '';

class menuScreen extends StatefulWidget {
  menuScreen({this.onSignedOut});
  // final BaseAuth auth;
  final VoidCallback onSignedOut;


  @override _MenuViewState createState() => _MenuViewState();


}

class _MenuViewState extends State<menuScreen> {
  _MenuViewState({this.auth,this.onSignedOut});
  final BaseAuth auth;
  final VoidCallback onSignedOut;
  int _currentIndex = 0;
  final int defaultSelectedIndex = 0;


  // _MenuViewState(this._childrenTwo);

  Future <void> _signOut(BuildContext context) async{
    try {
           var auth = Provider.of(context).auth;
               await auth.signOut();
              widget.onSignedOut();
            } catch (e) {
              print(e);
            }
  }



    final List<Widget>_children = [
      Homepage(),
      MyShifts(),
      Shifts(),
      Settings(),

    ];



  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('GrapeVine Health Care'),
        backgroundColor: Colors.black,
        elevation: 4.0,
        actions: [
          IconButton(
            icon: Icon(Icons.ac_unit),
            onPressed: () =>  _signOut(context),
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () =>  _signOut(context),
          ),
        ],
        leading: Icon(Icons.accessibility),
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
              label: 'Settings'),

        ],
      ),
    );
  }
}
