import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lets_chat/constants.dart';
import 'package:lets_chat/screens/chat_screen.dart';
import 'package:lets_chat/screens/login_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../components/roundedButton.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = '/register';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}
//Steps to use Firebase for Registration and Authentication
// 1. Initialise Firebase in initState
// 2. Create an instance of FirebaseAuth to use Authentication package
// 3. Create variables for user entries like email and password
// 4. Use onChanged method in TextInput to store the value of the
//    input into the variable
// 5. In the onPressed function of the Register Button, create a new
//    UserCredential object using auth.createUserWithEmailAndPassword
//    Method. Use that to navigate to the ChatScreen.

class _RegistrationScreenState extends State<RegistrationScreen> {
  late FirebaseAuth auth = FirebaseAuth.instance;
  late String email;
  late String password;
  bool showSpinner = false;
  get late => null;
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
    UserCredential? newUser;

    void chatNavigate() {
      if (newUser != null) {
        Navigator.pushNamed(context, ChatScreen.id);
      }
    }

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
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  //Do something with the user input.
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
                mycolor: Colors.blueAccent,
                text: 'Register',
                onPressedfunc: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    final newUser = await auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    showSpinner = false;
                    Navigator.pushNamed(context, ChatScreen.id);
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
