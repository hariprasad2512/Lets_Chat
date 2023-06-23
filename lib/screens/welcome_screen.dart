import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'package:lets_chat/screens/login_screen.dart';
import 'package:lets_chat/screens/registration_screen.dart';

import '../components/roundedButton.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = '/';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      duration: const Duration(
        seconds: 1,
      ),
      vsync: this,
    );

    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
    controller.forward();
    // animation.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     controller.reverse(from: 1.0);
    //   } else if (status == AnimationStatus.dismissed) {
    //     controller.forward();
    //   }
    // });
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      "Let's Chat",
                      speed: const Duration(milliseconds: 200),
                      textStyle: const TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                      ),
                    ),
                    // pewriterAnimatedText('Do not test bugs out, design them out'),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
                mycolor: Colors.lightBlueAccent,
                text: 'Log In',
                onPressedfunc: () =>
                    {Navigator.pushNamed(context, LoginScreen.id)}),
            RoundedButton(
                mycolor: Colors.blueAccent,
                text: 'Register',
                onPressedfunc: () =>
                    {Navigator.pushNamed(context, RegistrationScreen.id)}),
          ],
        ),
      ),
    );
  }
}
