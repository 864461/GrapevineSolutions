import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Homepage extends StatelessWidget {

  // OpeningView({this.auth,this.onSignedIn});
  // final BaseAuth auth;
  // final VoidCallback onSignedIn;


  @override
  Widget build(BuildContext context) {


    final ProfilePic = Column(
      children: [
        SizedBox(
          height:100,
          width:115,
          child:Stack(
            fit: StackFit.expand,
            overflow: Overflow.visible,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("Profile_avatar_placeholder_large.png"),
              ),
              Positioned(
                right: -12,
                bottom: 0,
                child: SizedBox(
                  height:46,
                  width:46,
                  child: FlatButton(
                    padding:EdgeInsets.zero,
                    shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                      color:Color(0xFFF5F6F9),
                    onPressed: (){},
                    // child: SvgPicture.asset("addImage.png")
                  ),
                ),
              )
            ],
          )
        )
      ],
    );
      //fit: BoxFit.scaleDown
      // height: mq.size.height / 3,


    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
          children: [
          ProfilePic,
      SizedBox(height: 20),
          // ProfileMenu(),
     ],
    ),
    );
  }
}
