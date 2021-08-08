import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

FirebaseAuth auth = FirebaseAuth.instance;


Future<String?> signup(String email,String password) async{
   try {
     UserCredential result = await auth.createUserWithEmailAndPassword(email: email, password: password);
     User? user = result.user;
     return Future.value('Account Created');
   }on FirebaseAuthException  catch (e) {
     print(e.message);
     return e.message;
   }
}

Future<String?> signin(String email,String password) async{
   try {
     UserCredential result = await auth.signInWithEmailAndPassword(email: email, password: password);
     User? user = result.user;
     return Future.value('Logged in');
   }on FirebaseAuthException catch (e) {
     final passwordCheck = SnackBar(
                          duration: Duration(seconds: 1),
                          content: Text(e.message!),
                          backgroundColor: Colors.red,
                        );
                        
                        print(e.message);
     return e.message;
   }
}

Future<bool?> signout() async{
  User? user = await auth.currentUser;

  await auth.signOut();
  return Future.value(true);

}