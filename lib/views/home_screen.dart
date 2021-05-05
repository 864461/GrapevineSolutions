// import 'dart:html';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '';
import '../theme/auth.dart';
import 'package:grapevine_solutions/views/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';



class Homepage extends StatefulWidget {
  Homepage({this.onSignedOut});
  final VoidCallback onSignedOut;

  @override
  HomepageState createState() => HomepageState();
}

class HomepageState extends State<Homepage> {
  HomepageState({this.onSignedOut});
  final VoidCallback onSignedOut;



  File _imageFile;
  final picker = ImagePicker();

Future getImage(context) async {
    final pickedFile = await picker.getImage(source: runtimeType == 1 ? ImageSource.camera : ImageSource.gallery);
    setState(() {
      _imageFile = File(pickedFile.path);
    });
    upload(context);

}

  Future upload(BuildContext context) async{

      var auth = Provider.of(context).auth;
      final user = await auth.getCurrentData();
      final userid = user.uid;
      String fileName = _imageFile.path;
      Reference ref =
      FirebaseStorage.instance.ref().child('uploads/$userid');
      UploadTask uploadTask = ref.putFile(_imageFile);
      TaskSnapshot taskSnapshot = await uploadTask;
      taskSnapshot.ref.getDownloadURL().then(
            (value) => print("Done: $value"),
      );
      getUserImage(context);
    }

    Image  _userUrl;
 Future getUserImage(BuildContext context) async {
    var auth = Provider.of(context).auth;
    final user = await auth.getCurrentData();
    final userid = user.uid;
    final ref = FirebaseStorage.instance.ref().child('uploads/$userid');
// no need of the file extension, the name will do fine.
    var url = await ref.getDownloadURL();
   Image userImage = Image.network(url);
    print(url);
   setState(() {
     _userUrl = userImage;
   });
  }


  userImage(){
    if(_userUrl != null){
      return _userUrl;
    }else{
      return "Profile_avatar_placeholder_large.png";
    }
  }



 // String _setImage(String url) {
 //   setLock();
 //    if(url != null){
 //      return url;
 //    }else{
 //      return "Profile_avatar_placeholder_large.png";
 //    }
 //
 //    // print()
 //  }


  Future<void> _signOut(BuildContext context) async {
    try {
      var auth = Provider.of(context).auth;
      await auth.signOut();
      widget.onSignedOut();
    } catch (e) {
      print(e);
    }
  }




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
                     new  AssetImage(userImage()),
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
                      onPressed: () {
                        getImage(context);
                      },
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
              Icon(Icons.beenhere_outlined),
              SizedBox(width: 20),
              Expanded(
                child: Text(
                  "Total Shifts",
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  "8",
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: 20),
              Icon(Icons.access_alarm_outlined),
              SizedBox(width: 20),
              Expanded(
                child: Text(
                  "Total Hours",
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  "72",
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
                child: Text(
                  "My Account",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.green,
              )
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
                child: Text(
                  "Reference",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.green,
              )
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
                child: Text(
                  "Documents",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.green,
              )
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
                child: Text(
                  "Activities",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.green,
              )
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
              widget.onSignedOut();
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
                child: Text(
                  "Log-Out",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.green,
              )
            ],
          ),
        ));

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          FutureBuilder(
            future: Provider.of(context).auth.getCurrentData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Text("${snapshot.data.displayName}");
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
          SizedBox(height: 40),
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
