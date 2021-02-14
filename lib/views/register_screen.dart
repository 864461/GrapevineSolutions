import 'package:flutter/cupertino.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grapevine_solutions/main.dart';
import 'package:grapevine_solutions/theme/root_page.dart';
import 'package:grapevine_solutions/views/provider.dart';
import 'package:toast/toast.dart';
import 'package:grapevine_solutions/theme/auth.dart';
import 'package:grapevine_solutions/views/login_screen.dart';


class Register extends StatefulWidget {
  Register({ this.onRegister,this.onSignedIn,});
  final VoidCallback onRegister;
  final VoidCallback onSignedIn;



  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController usernameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController rePasswordController = new TextEditingController();

  bool isSubmitting = false;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    final logo = Image.asset(
      "image.png",
      //fit: BoxFit.scaleDown
      height: mq.size.height / 4,
    );
    final signuptext = TextField(
      decoration:InputDecoration(
        border:InputBorder.none,
        // style:TextStyle(fontSize:22,fontStyle:FontStyle.italic,color: Colors.black),
        hintText:'Sign Up',
        hintStyle:TextStyle(
          color: Colors.red,
          fontSize:25,
          fontStyle:FontStyle.italic,
        ),
      ),
    );


    final welcomeMessage = Center(
      child:Text.rich(
        TextSpan(children:<TextSpan>[
          TextSpan(
              text:'Lets Get Started!',
              style:TextStyle(fontSize:18,color: Colors.black)
          ),
        ]
        ),
      ),
    );

    final emailField = TextFormField(
      //enabled: isSubmitting,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(color: Colors.black),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        //fillColor: Colors.red,
        hintText: "somethinf@example.com",
        labelText: "Email",
        labelStyle: TextStyle(color: Colors.black),
        hintStyle: TextStyle(
          color: Colors.white,
        ),
      ),
    );

    final usernameField = TextFormField(
      //enabled: isSubmitting,
      controller: usernameController,
      //keyboardType:  TextInputType.emailAddress,
      style: TextStyle(color: Colors.black),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        //fillColor: Colors.red,
        hintText: "John Doe",
        labelText: "User Name",
        labelStyle: TextStyle(color: Colors.black),
        hintStyle: TextStyle(
          color: Colors.black,
        ),
      ),
    );

    final passwordField = Column(
      children: <Widget>[
        TextFormField(
          obscureText: true,
          //enabled: isSubmitting,
          controller: passwordController,
          style: TextStyle(color: Colors.black),
          cursorColor: Colors.white,
          decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            //fillColor: Colors.red,
            hintText: "Password",
            labelText: "Password",
            labelStyle: TextStyle(color: Colors.black),
            hintStyle: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        // Padding(
        //   padding: EdgeInsets.all(2.0),
        // ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   children: <Widget>[
        //     MaterialButton(
        //       child:Text(
        //         "Forgot Password",
        //         style: Theme.of(context).textTheme.caption.copyWith(color:Colors.white),
        //       ),
        //       onPressed: (){
        //         // Create forgot password form pop up
        //       },
        //     )
        //   ],
        // )
      ],
    );

    final repasswordField = Column(
      children: <Widget>[
        TextFormField(
          obscureText: true,
          //enabled: isSubmitting,
          controller: rePasswordController,
          style: TextStyle(color: Colors.black),
          cursorColor: Colors.white,
          decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            //fillColor: Colors.red,
            hintText: "Password",
            labelText: "Re-enter Password",
            labelStyle: TextStyle(color: Colors.black),
            hintStyle: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ],
    );

    final fields = Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          signuptext,
          welcomeMessage,
          usernameField,
          emailField,
          passwordField,
          repasswordField,
        ],
      ),
    );

    displayToastMessage(String message,BuildContext context){
      Toast.show(message, context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
    }

    // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    registerNewUser(BuildContext context) async {
      var auth = Provider.of(context).auth;
      String userId = await auth.createUserWithEmailAndPassword(emailController.text, passwordController.text,);
      print("Created user : $userId");

      if (userId != null) {

        Map userDataMap = {
          "name": usernameController.text.trim(),
          "email": emailController.text.trim(),
        };
        usersRef.child(userId).set(userDataMap);
        displayToastMessage(
            "Congratulation you have created An Account ", context);
        print("Registered : $userId");
        widget.onRegister();
        // Navigator.of(context).pushNamed(AppRoutes.authMenu);
      } else {
        displayToastMessage("New user account has not been created", context);
      }
    }

    final registerButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular((25.0)),
      color: Colors.red,
      child: MaterialButton(
        minWidth: mq.size.width / 1.2,
        padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
        child: Text(
          "Register",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {

          if(usernameController.text.length < 4){
            displayToastMessage("User Name must constain atleast 3 characters ",context);
          }
          else if(!emailController.text.contains("@")) {
            displayToastMessage("Email is not Valid ",context);
          }
          else if(passwordController.text.length < 6){
            displayToastMessage("User Name must constain atleast 3 characters ",context);
          }
          else if(rePasswordController.text != passwordController.text){
            displayToastMessage("Passwords are not the same  ",context);
          }
          else{
            registerNewUser(context);
          }
        },
      ),
    );

    final bottom = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        registerButton,
        Padding(
          padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          // padding: EdgeInsets.all(8.0),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Already member?",
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(color: Colors.black),
            ),
            MaterialButton(
                onPressed: () {

                  try {
                    widget.onSignedIn();
                  } catch (e) {
                  }
                  // Navigator.push(
                  //     context,
                  //     PageRouteBuilder(
                  //       transitionDuration: Duration(seconds: 2),
                  //       transitionsBuilder:
                  //           (context, animation, animationTime, child) {
                  //         return ScaleTransition(
                  //           alignment: Alignment.topCenter,
                  //           scale: animation,
                  //           child: child,
                  //         );
                  //       },
                  //       pageBuilder: (context, animation, animationTime) {
                  //         return Login();
                  //       },
                  //     ));

                  // Navigator.of(context).pushNamed(AppRoutes.authLogin);
                },
                child: Text(
                  "Log in",
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                      color: Colors.black,
                      decoration: TextDecoration.underline),
                ))
          ],
        ),
      ],
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
            padding: EdgeInsets.all(36),
            child: Container(
                height: mq.size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    logo,
                    fields,
                    Padding(
                      padding: EdgeInsets.only(bottom: 70),
                      child: bottom,
                    ),
                  ],
                ))),
      ),
    );
  }
}
