import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grapevine_solutions/theme/AppRoutes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../theme/auth.dart';
import '';

class Login extends StatefulWidget {
  Login({this.auth,this.onSignedIn});
  final BaseAuth auth;
  final VoidCallback onSignedIn;

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  // TextEditingController _emailController;
  // TextEditingController _passwordController;

  bool isSubmitting = false;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    final logo = Image.asset(
      "logo2.jpeg",
      //fit: BoxFit.scaleDown
      height: mq.size.height / 3,
    );

    final emailField = TextFormField(
      //enabled: isSubmitting,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        //fillColor: Colors.red,
        hintText: "somethinf@example.com",
        labelText: "Email",
        labelStyle: TextStyle(color: Colors.white),
        hintStyle: TextStyle(
          color: Colors.white,
        ),
      ),
    );

    final passwordField = Column(
      children: <Widget>[
        TextFormField(
          obscureText: true,
          //enabled: isSubmitting,
          controller: passwordController,
          style: TextStyle(color: Colors.white),
          cursorColor: Colors.white,
          decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            //fillColor: Colors.red,
            hintText: "Password",
            labelText: "Password",
            labelStyle: TextStyle(color: Colors.white),
            hintStyle: TextStyle(
              color: Colors.white,
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
                    .copyWith(color: Colors.white),
              ),
              onPressed: () {
                // Create forgot password form pop up
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
        children: <Widget>[emailField, passwordField],
      ),
    );

    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular((25.0)),
      color: Colors.white,
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
           String userId = await widget.auth.signInWithEmailAndPassword(emailController.text, passwordController.text,);
           print("Signed in : $userId");

            // User user =
            //     (await FirebaseAuth.instance.signInWithEmailAndPassword(
            //   email: emailController.text,
            //   password: passwordController.text,
            // )).user;
            widget.onSignedIn();
            // if (userId != null) {
            //   Navigator.of(context).pushNamed(AppRoutes.authMenu);
            // }
          } catch (e) {
            print(e);
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
                  .copyWith(color: Colors.white),
            ),
            MaterialButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.authRegister);
                },
                child: Text(
                  "Sign Up",
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                      color: Colors.white,
                      decoration: TextDecoration.underline),
                ))
          ],
        ),
      ],
    );

    return Scaffold(
      backgroundColor: Colors.blue,
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
