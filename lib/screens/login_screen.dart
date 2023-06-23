import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lets_chat/components/roundedButton.dart';
import 'package:lets_chat/constants.dart';
import 'package:lets_chat/screens/chat_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  static String id = '/login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String email;
  late String password;
  bool showSpinner = false;
  late FirebaseAuth auth = FirebaseAuth.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    late final UserCredential loggedInUser;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Flexible(
                  child: Hero(
                    tag: 'logo',
                    child: Container(
                      height: 200.0,
                      child: Image.asset('images/logo.png'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 48.0,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    //Do something with the user input.\
                    email = value;
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: kTextFieldDecoration.copyWith(
                      hintStyle: TextStyle(color: Colors.grey),
                      hintText: 'Enter your email'),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  obscureText: true,
                  onChanged: (value) {
                    //Do something with the user input.
                    password = value;
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your password',
                      hintStyle: TextStyle(color: Colors.grey)),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 24.0,
                ),
                RoundedButton(
                  mycolor: Colors.lightBlueAccent,
                  text: 'Log In',
                  onPressedfunc: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      loggedInUser = await auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      showSpinner = false;
                      Navigator.pushNamed(context, ChatScreen.id);
                    } catch (e) {
                      print(e);
                    }
                  },
                )
              ]),
        ),
      ),
    );
  }
}
