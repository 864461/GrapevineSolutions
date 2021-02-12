// import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/rendering.dart';
import '';
import '../theme/auth.dart';
import 'package:grapevine_solutions/views/provider.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

class Homepage extends StatefulWidget {
  Homepage({this.onSignedOut});
  final VoidCallback onSignedOut;

  @override HomepageState createState() => HomepageState();
}
class HomepageState extends State<Homepage>{
  HomepageState({this.onSignedOut});
  final VoidCallback onSignedOut;


  @override
  Widget build(BuildContext context) {
    final profilePic = Column(
      children: [
        SizedBox(
            height: 100,
            width: 115,
            child: Stack(
              fit: StackFit.expand,
              overflow: Overflow.visible,
              children: [
                CircleAvatar(
                  backgroundImage:
                      AssetImage("Profile_avatar_placeholder_large.png"),
                ),
                Positioned(
                  right: -12,
                  bottom: 0,
                  child: SizedBox(
                    height: 46,
                    width: 46,
                    child: FlatButton(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: BorderSide(color: Colors.white),
                      ),
                      color: Color(0xFFF5F6F9),
                      onPressed: () {},
                      child: Icon(
                        Icons.add_a_photo,
                      ),
                    ),
                  ),
                )
              ],
            ))
      ],
    );


    final shifts = Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: FlatButton(
          padding: EdgeInsets.all(20),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: Color(0xFFF5F6F9),
          child: Row(
            children: [
              // SizedBox(width: 20),
            Icon(
            Icons.beenhere_outlined),
              SizedBox(width:20),
              Expanded(
                child: Text("Total Shifts"),
              ),
              Expanded(
                child: Text("8"),
              ),
              SizedBox(width: 20),
              Icon(
                  Icons.access_alarm_outlined),
              SizedBox(width:20),
              Expanded(
                child: Text("Total Hours"),
              ),
              Expanded(
                child: Text("72"),
              ),
              // Icon(Icons.arrow_forward_ios)
            ],
          ),
        ));




    final profile = Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: FlatButton(
          padding: EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: Color(0xFFF5F6F9),
          onPressed: () {},
          child: Row(
            children: [
              Icon(
                Icons.account_circle_outlined,
                size: 40,
              ),
              SizedBox(width: 20),
              Expanded(
                child: Text("My Account"),
              ),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
        ));

    final reference = Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: FlatButton(
          padding: EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: Color(0xFFF5F6F9),
          onPressed: () {},
          child: Row(
            children: [
              Icon(
                Icons.archive,
                size: 40,
              ),
              SizedBox(width: 20),
              Expanded(
                child: Text("Reference"),
              ),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
        ));

    final insertDocuments = Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: FlatButton(
          padding: EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: Color(0xFFF5F6F9),
          onPressed: () {},
          child: Row(
            children: [
              Icon(
                Icons.picture_as_pdf_outlined,
                size: 40,
              ),
              SizedBox(width: 20),
              Expanded(
                child: Text("Documents"),
              ),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
        ));

    final activities = Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: FlatButton(
          padding: EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: Color(0xFFF5F6F9),
          onPressed: () {},
          child: Row(
            children: [
              Icon(
                Icons.post_add_outlined,
                size: 40,
              ),
              SizedBox(width: 20),
              Expanded(
                child: Text("Activities"),
              ),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
        ));

    final logout = Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: FlatButton(
          padding: EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: Color(0xFFF5F6F9),
          onPressed: () async {
            try {
              var auth = Provider.of(context).auth;
              await auth.signOut();
              onSignedOut();
            } catch (e) {
              print(e);
            }
          },
          child: Row(
            children: [
              Icon(
                Icons.logout,
                size: 40,
              ),
              SizedBox(width: 20),
              Expanded(
                child: Text("Log-Out"),
              ),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
        ));

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          FutureBuilder(
            future: Provider.of(context).auth.currentUserUid(),
            builder: (context,snapshot){
              if(snapshot.connectionState == ConnectionState.done) {
                return Text("${snapshot.data}");
              } else{
                 return CircularProgressIndicator();
              }
            },
          ),
          profilePic,
          SizedBox(height: 40),
          shifts,
          SizedBox(height: 30),
          profile,
          reference,
          insertDocuments,
          activities,
          logout,
        ],
      ),
    );
  }
}
