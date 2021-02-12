import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grapevine_solutions/theme/AppRoutes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../theme/auth.dart';
import 'package:grapevine_solutions/views/home_screen.dart';
import 'package:grapevine_solutions/views/provider.dart';
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

  void _signOut(BuildContext context) async{
    try {
           var auth = Provider.of(context).auth;
               await auth.signOut();
              onSignedOut();
            } catch (e) {
              print(e);
            }
  }



    final List<Widget>_children = [
      Homepage(),
      Center(child: Text('Shifts')),
      Center(child: Text('Search Shifts')),
      Center(child: Text('Settings')),

    ];



  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        actions: <Widget> [
          new FlatButton(
            child: new Text("Log-Out",style: new TextStyle(fontSize:17,color: Colors.black)),
            onPressed: () =>  _signOut(context),

          )


        ],
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
