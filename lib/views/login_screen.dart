import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grapevine_solutions/theme/AppRoutes.dart';
import 'package:grapevine_solutions/views/provider.dart';
import 'package:toast/toast.dart';
import 'package:path_provider/path_provider.dart';
import '../theme/auth.dart';
import '';
import 'package:grapevine_solutions/views/register_screen.dart';

class Login extends StatefulWidget {
  Login({this.onSignedIn,this.notRegistered});
  final VoidCallback onSignedIn;
  final VoidCallback notRegistered;

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();



  bool isSubmitting = false;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    final logo = Image.asset(
      "image.png",
      //fit: BoxFit.scaleDown
      height: mq.size.height / 3,
    );

    void showAlertDialog(BuildContext context) {
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
                    Text("Insert Reset Email:"),
                    TextField(
                      controller: _emailControllerField,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        hintText: "something@example.com",
                        labelText: "Email",
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(25.0),
                        color: Color(0xff8c52ff),
                        child: MaterialButton(
                          minWidth: 20/ 2,
                          padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                          child: Text(
                            "Send Reset Email",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () async {
                            try {
                              var auth = Provider.of(context).auth;
                             await auth.sendPasswordResetEmail(emailController.text);
                              Navigator.of(context).pop();
                            } catch (e) {
                              print(e);
                              // TODO: Add snackbar reporting error
                            }
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



    final signuptext = TextField(
      decoration:InputDecoration(
        border:InputBorder.none,
          // style:TextStyle(fontSize:22,fontStyle:FontStyle.italic,color: Colors.black),
        hintText:'Log-In',
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
              text:'Hi there! Nice to see you again',
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
      cursorColor: Colors.black,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        //fillColor: Colors.red,
        hintText: "somethinf@example.com",
        labelText: "Email",
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
          cursorColor: Colors.black,
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
        Padding(
          padding: EdgeInsets.all(2.0),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            MaterialButton(
              child: Text(
                "Forgot Password",
                style: Theme.of(context)
                    .textTheme
                    .caption
                    .copyWith(color: Colors.black),
              ),
              onPressed: () {
                showAlertDialog(context);
              },
            )
          ],
        )
      ],
    );

    final fields = Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[signuptext,welcomeMessage,emailField, passwordField],
      ),
    );

    displayToastMessage(String message,BuildContext context){
      Toast.show(message, context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
    }
    String errMsg() => 'Amount should be greater than zero';

    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular((25.0)),
      color: Colors.red,
      child: MaterialButton(
        minWidth: mq.size.width / 1.2,
        padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
        child: Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () async {
           try {
             var auth = Provider.of(context).auth;
           String userId = await auth.signInWithEmailAndPassword(emailController.text, passwordController.text,);
           print("Signed in : $userId");
            widget.onSignedIn();
          } catch (e) {
             displayToastMessage("Incorrect fields please try Again  ",context);
            print(e.errMsg());
            displayToastMessage("Incorrect fields please try Again  ",context);
            emailController.text = "";
            passwordController.text = "";
          }

          //Todo
          // print('Login Pressed');
        },
      ),
    );

    final bottom = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        loginButton,
        Padding(
          padding: EdgeInsets.all(8.0),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Not a member?",
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(color: Colors.black),
            ),
            MaterialButton(
                onPressed: () async {

                  try {
                    widget.notRegistered();
                  } catch (e) {
                  }
                  // Navigator.push(
                  // context,
                  // PageRouteBuilder(
                  //   transitionDuration: Duration(seconds:2),
                  //   transitionsBuilder:
                  //       (context, animation, anotherAnimation, child) {
                  //     return ScaleTransition(
                  //       alignment:Alignment.topCenter,
                  //       scale:animation,
                  //         child:child,
                  //     );
                  //   },
                  //   pageBuilder:(context,animation,animationTime){
                  //     return widget.notRegistered();
                  //   },
                  // ));


                  // Navigator.of(context).pushNamed(AppRoutes.authRegister);
                },
                child: Text(
                  "Sign Up",
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
