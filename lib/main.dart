import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myinstagram/pages/Authorization.dart';
import 'package:myinstagram/pages/Chats.dart';
import 'package:myinstagram/pages/login.dart';
import 'package:myinstagram/pages/mainfeed.dart';
import 'package:myinstagram/pages/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var uid =  prefs.getString('uid');
  runApp(
    MaterialApp( title: 'MyInstagram',
      debugShowCheckedModeBanner: false,
      home: uid==null ? Authorization() : Mainfeed(uid: uid,) ,
  routes: {
        Login.id: (context) =>Login(),
        Signup.id: (context) =>Signup(),
        Chats.id: (context) =>Chats(),
      },));
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
        
        Chats.id: (context) =>Chats(),
      },
    );
  }
}


