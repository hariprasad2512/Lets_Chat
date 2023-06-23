import 'package:flutter/material.dart';
import 'package:lets_chat/screens/welcome_screen.dart';
import 'package:lets_chat/screens/login_screen.dart';
import 'package:lets_chat/screens/registration_screen.dart';
import 'package:lets_chat/screens/chat_screen.dart';

void main() => runApp(LetsChat());

class LetsChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        ChatScreen.id: (context) => ChatScreen()
      },
    );
  }
}
