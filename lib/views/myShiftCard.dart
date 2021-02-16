


// import 'dart:html';
// import 'dart:html';
import 'package:grapevine_solutions/views/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/rendering.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grapevine_solutions/views/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:grapevine_solutions/views/shift.dart';



Widget MyShiftCard(BuildContext context,DocumentSnapshot document){

  final shift = Shift.fromSnapshot(document);



  var currentUserId = FutureBuilder(

    future: Provider.of(context).auth.getCurrentData(),
    builder: (context,snapshot){
      if(snapshot.connectionState == ConnectionState.done) {
        return Text("snapshot.data.uid");
      } else{
        return CircularProgressIndicator();
      }
    },
  );

  void showAlertDialog2(BuildContext context,hospital,date,time,id) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          TextEditingController _emailControllerField =
          TextEditingController();
          return AlertDialog(
            content: Container(
              width: 1000/ 1.2,
              height: 1000/ 4.5,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Text("Please Confirm Cancellation "),
                  SizedBox(height: 40),
                  Text(
                    "Hospital : " +
                        "  " +
                        shift.hospital,
                    style: TextStyle(
                      color: Color(
                          0xffe6020a),
                      fontSize: 14.0,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Date :" +
                        " " +
                        shift.date  + shift.documentId +
                        " " +
                        "Time  :" +
                        " " +
                        shift.time,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14.0,
                    ),
                  ),
                  Text(
                    "Shift Rate  :" +
                        " " +
                        shift.shiftRate
                    ,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 20.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(25.0),
                      color: Color(0xff8c52ff),
                      child: MaterialButton(
                        minWidth: 20 / 2,
                        padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                        child: Text(
                          "Confrim Cancellation ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () async {
                          try {
                            // var auth = Provider.of(context).auth;
                            // final user = await auth.getCurrentData();
                            // final userid = user.uid;
                            var id = shift.documentId;
                            FirebaseFirestore.instance.collection("Shifts")
                            // .where("userid", isEqualTo: "")
                                .doc(id)
                                .update({'userid' : ""});
                            // Navigator.of(context).pop();

                          } catch (e) {
                            print(e);
                            // TODO: Add snackbar reporting error
                          }
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }







  return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        // scrollDirection: Axis.vertical,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                child: new FittedBox(
                  child: Material(
                      color: Colors.white,
                      elevation: 14.0,
                      borderRadius: BorderRadius.circular(24.0),
                      shadowColor: Color(0x802196F3),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 16.0), ////right here man
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Padding(
                                    padding:
                                    const EdgeInsets.only(
                                        left: 8.0),
                                    child: Container(
                                        child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceEvenly,
                                            children: <Widget>[
                                              Container(
                                                child: Icon(
                                                  Icons
                                                      .add_location_alt,
                                                  color: Colors.black,
                                                  size: 30.0,
                                                ),
                                              ),
                                              SizedBox(width: 20),
                                              Container(
                                                  child: Text(
                                                    "Hospital : " +
                                                        "  " +
                                                        shift.hospital,
                                                    style: TextStyle(
                                                      color: Color(
                                                          0xffe6020a),
                                                      fontSize: 24.0,
                                                      fontWeight:
                                                      FontWeight.bold,
                                                    ),
                                                  )),
                                            ])),
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.only(
                                        left: 8.0),
                                    child: Container(
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceEvenly,
                                          children: <Widget>[
                                            Container(
                                                child: Text(
                                                  "PostCode :" +
                                                      " " +
                                                      shift.postcode,
                                                  style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 24.0,
                                                  ),
                                                )),
                                            SizedBox(width: 20),
                                            Container(
                                                child: Text(
                                                  "Ward :" +
                                                      " " +
                                                      shift.ward +
                                                      " " +
                                                      shift.wardType,
                                                  style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 24.0,
                                                  ),
                                                )),
                                            Container(
                                              child: Icon(
                                                FontAwesomeIcons
                                                    .solidStar,
                                                color: Colors.amber,
                                                size: 15.0,
                                              ),
                                            ),
                                            Container(
                                              child: Icon(
                                                FontAwesomeIcons
                                                    .solidStar,
                                                color: Colors.amber,
                                                size: 15.0,
                                              ),
                                            ),
                                            Container(
                                              child: Icon(
                                                FontAwesomeIcons
                                                    .solidStar,
                                                color: Colors.amber,
                                                size: 15.0,
                                              ),
                                            ),
                                            Container(
                                              child: Icon(
                                                FontAwesomeIcons
                                                    .solidStar,
                                                color: Colors.amber,
                                                size: 15.0,
                                              ),
                                            ),
                                            Container(
                                              child: Icon(
                                                FontAwesomeIcons
                                                    .solidStarHalf,
                                                color: Colors.amber,
                                                size: 15.0,
                                              ),
                                            ),
                                            Container(
                                                child: Text(
                                                  "(321) \u00B7 0.9 mi",
                                                  style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 18.0,
                                                  ),
                                                )),
                                          ],
                                        )),
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.only(
                                        left: 8.0),
                                    child: Container(
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceEvenly,
                                          children: <Widget>[
                                            Container(
                                              child: Icon(
                                                Icons
                                                    .access_time_outlined,
                                                color: Colors.black,
                                                size: 30.0,
                                              ),
                                            ),
                                            SizedBox(width: 20),
                                            Container(
                                                child: Text(
                                                  "Date :" +
                                                      " " +
                                                      shift.date  +
                                                      " " +
                                                      "Time  :" +
                                                      " " +
                                                      shift.time,
                                                  style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 24.0,
                                                  ),
                                                )

                                            ),
                                            SizedBox(width: 20),
                                            Container(
                                                child: Text(
                                                  "Shift Rate  :" +
                                                      " " +
                                                      shift.shiftRate
                                                  ,
                                                  style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 24.0,
                                                  ),
                                                )),
                                            Container(
                                              child: Icon(
                                                Icons
                                                    .attach_money_sharp,
                                                color: Colors.black,
                                                size: 30.0,
                                              ),
                                            ),
                                          ],
                                        )),
                                  ),
                                  // FutureBuilder(
                                  //   future: Provider.of(context)
                                  //       .auth
                                  //       .getCurrentData(),
                                  //   builder: (context, snapshot) {
                                  //     if (snapshot.connectionState ==
                                  //         ConnectionState.done) {
                                  //       return snapshot.data
                                  //     } else {
                                  //       return CircularProgressIndicator();
                                  //     }
                                  //   },
                                  // ),
                                  MaterialButton(
                                    elevation: 100,
                                    child: Text(
                                      "Cancel",
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 50.0,
                                      ),
                                    ),

                                    onPressed: () {
                                      showAlertDialog2(context,shift.hospital,shift.date,shift.time,shift.time);
                                      // showDialog(
                                      // context: context,
                                      // builder: (BuildContext context) => leadDialog);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 250,
                            height: 200,
                            child: ClipRRect(
                              borderRadius:
                              new BorderRadius.circular(24.0),
                              child: Image(
                                fit: BoxFit.contain,
                                alignment: Alignment.topRight,
                                image: NetworkImage(
                                    "https://snworksceo.imgix.net/cav/bbe66a4b-d719-4c65-8eb1-433a5e359b1e.sized-1000x1000.jpg?w=1000"),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
            ),
          ]));






}