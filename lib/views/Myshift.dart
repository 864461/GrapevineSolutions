

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/rendering.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '';
import '../theme/auth.dart';
import 'package:grapevine_solutions/views/upcoming.dart';
import 'package:grapevine_solutions/views/mypast.dart';
import 'package:grapevine_solutions/views/shift_card.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

class MyShifts extends StatefulWidget {
  // Shifts({this.onSignedOut});
  // final VoidCallback onSignedOut;

  @override MyShiftState createState() => MyShiftState();
}
class MyShiftState extends State<MyShifts> {



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("My Shifts"),
            backgroundColor: Colors.black,
            bottom: TabBar(
              indicatorWeight: 10.0,
              indicatorColor: Colors.black,
              tabs: <Widget>[
                Tab(
                  text: 'Upcoming Shifts ',
                ),
                Tab(
                  text: 'Past Shifts ',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              myUpcoming(),
              myPast(),
            ],
          )),
    );
  }

  ListView _buildListViewWithName(String s) {
    return ListView.builder(itemBuilder: (context, index)=>ListTile(
      title: Text(s+' $index'),
    ));
  }
}