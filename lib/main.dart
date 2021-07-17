import 'package:flutter/material.dart';
import 'package:myinstagram/pages/Authorization.dart';
import 'package:myinstagram/pages/Chats.dart';
import 'package:myinstagram/pages/login.dart';
import 'package:myinstagram/pages/mainfeed.dart';
import 'package:myinstagram/pages/signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyInstagram',
      debugShowCheckedModeBanner: false,
      home: Authorization(),
      routes: {
        Login.id: (context) =>Login(),
        Signup.id: (context) =>Signup(),
        Mainfeed.id: (context) =>Mainfeed(),
        Chats.id: (context) =>Chats(),
      },
    );
  }
}


