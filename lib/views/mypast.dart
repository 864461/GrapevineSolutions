// import 'dart:html';

// import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/rendering.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grapevine_solutions/views/provider.dart';
import '';
import '../theme/auth.dart';
import 'package:grapevine_solutions/views/shift.dart';
import 'package:grapevine_solutions/views/mypastcard.dart';
import 'package:intl/intl.dart';

// ignore: camel_case_types
class myPast extends StatefulWidget {
  // Shifts({this.onSignedOut});
  // final VoidCallback onSignedOut;

  @override
  myPastShift createState() => myPastShift();
}

// ignore: camel_case_types
class myPastShift extends State<myPast> {
  TextEditingController _searchController = TextEditingController();

  Future resultsLoaded;
  List _allResults = [];
  List _resultsList = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    resultsLoaded = getShiftsStreamSnapshots();
  }

  _onSearchChanged() {
    searchResultsList();
  }

  searchResultsList() {
    var showResults = [];

    if (_searchController.text != "") {
      for (var shiftSnapshot in _allResults) {
        // var hospital = (shift).Hospital.toLowerCase();
        var hospital = Shift.fromSnapshot(shiftSnapshot).hospital.toLowerCase();

        if (hospital.contains(_searchController.text.toLowerCase())) {
          showResults.add(shiftSnapshot);
        }
      }
    } else {
      showResults = List.from(_allResults);
    }
    setState(() {
      _resultsList = showResults;
    });
  }

  getShiftsStreamSnapshots() async {
    var auth = Provider.of(context).auth;
    final user = await auth.getCurrentData();
    final userid = user.uid;
    // final uid = await Provider.of(context).auth.getCurrentUID();
    var data = await FirebaseFirestore.instance
        .collection('Shifts')
        // .docs()
        .where("userid", isEqualTo: userid)
        .get();
    setState(() {
      _allResults = data.docs;
    });
    searchResultsList();
    print(_allResults);
    return "complete";
  }

  // ShiftState({this.onSignedOut});
  // final VoidCallback onSignedOut;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(height: 40),
          Text("Search Past Shifts  ", style: TextStyle(fontSize: 20)),
          Padding(
            padding:
                const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 30.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(prefixIcon: Icon(Icons.search)),
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: _resultsList.length,
            itemBuilder: (BuildContext context, int index) =>
                MyPastCard(context, _resultsList[index]),
          )),
        ],
      ),
    );
  }
}
