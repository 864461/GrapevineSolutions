import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Shift {
  String hospital;
  String date;
  String time;
  String shiftRate;
  String ward;
  String wardType;
  String postcode;
  String userId;
  String documentId;
  double saved;



  Shift(
      this.hospital,
      this.date,
      this.time,
      this.shiftRate,
      this.ward,
      this.wardType,
      this.postcode,
      this.userId
      );

  // formatting for upload to Firebase when creating the Shift
  Map<String, dynamic> toJson() => {
    'hospital': hospital,
    'date': date,
    'time': time,
    'shiftRate': shiftRate,
    'ward': ward,
    'wardType': wardType,
    'postcode': postcode,
    'userId': userId,
  };

  // creating a Shift object from a firebase snapshot
  Shift.fromSnapshot(DocumentSnapshot snapshot) :
        hospital = snapshot.data()['Hospital'],
        date = snapshot.data()['Date'],
        time = snapshot.data()['Time'],
        shiftRate = snapshot.data()['Shift Rate'],
        ward = snapshot.data()['Ward'],
        wardType = snapshot.data()['Ward Type'],
        postcode = snapshot.data()['Postcode'],
        userId = snapshot.data()['userId'],
        documentId = snapshot.id,
        saved = snapshot.data()['saved'];



  // Map<String, Icon> types() => {
  //   "car": Icon(Icons.directions_car, size: 50),
  //   "bus": Icon(Icons.directions_bus, size: 50),
  //   "train": Icon(Icons.train, size: 50),
  //   "plane": Icon(Icons.airplanemode_active, size: 50),
  //   "ship": Icon(Icons.directions_boat, size: 50),
  //   "other": Icon(Icons.directions, size: 50),
  // };

  // // return the google places image
  // Image getLocationImage() {
  //   final baseUrl = "https://maps.googleapis.com/maps/api/place/photo";
  //   final maxWidth = "1000";
  //   final url = "$baseUrl?maxwidth=$maxWidth&postcode=$postcode&key=$PLACES_API_KEY";
  //   return Image.network(url, fit: BoxFit.cover);
  // }

  // int getTotalShiftDays() {
  //   return time.difference(date).inDays;
  // }

  // int getDaysUntilShift() {
  //   int diff = date.difference(DateTime.now()).inDays;
  //   if (diff < 0) {
  //     diff = 0;
  //   }
  //   return diff;
  // }
}