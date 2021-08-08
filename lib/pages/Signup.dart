import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:myinstagram/pages/Login.dart';
import 'package:myinstagram/pages/auth_firebase.dart';
import 'package:myinstagram/pages/mainfeed.dart';
import 'package:myinstagram/pages/usersetup.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Signup extends StatefulWidget {
  static final String id= 'signup';
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
String? email,password,username,cpassword;
final auth=FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final ref = FirebaseDatabase.instance.reference().child('users');
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:<Widget>[
            SizedBox(height:0),
            Text(
              'MyInstagram',
              style: TextStyle(fontFamily: 'Dancing',
              fontSize: 50,
              fontWeight: FontWeight.bold,
              )
              ),
              SizedBox(height:30),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                  onChanged: (value){
                    setState(() {
                      email=value.trim();
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Username'),
                  onChanged: (value){
                    setState(() {
                      username=value.trim();
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  onChanged: (value){
                    setState(() {
                      password=value.trim();
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Confirm password'),
                  obscureText: true,
                  onChanged: (value){
                    setState(() {
                      cpassword=value.trim();
                    });
                  },
                ),
              ),
              Container(
                width:300,
                child: OutlinedButton(
                  onPressed:() async{
                   if (cpassword==password) {
                       await signup(email!, password!).whenComplete(() async{
                           var user =  FirebaseAuth.instance.currentUser;
                          
                           String uid = user!.uid;
                          
                           SharedPreferences prefs = await SharedPreferences.getInstance();
                           await prefs.setString("uid", uid);
                           await prefs.setString("username", username!);
                           await prefs.setString("profilepicture", 'https://th.bing.com/th/id/OIP.J9ameRkhThciJESEKvadfAHaHa?pid=ImgDet&rs=1');
                           await prefs.setString("bio", ' ');
                         usersetup(username!,email!,password!);
                           Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> Mainfeed(uid: user.uid,)));
                          }
                         )
                         ;
                        }
                 else{
                        final passwordCheck = SnackBar(
                          duration: Duration(seconds: 1),
                          content: Text("Please validate your Password"),
                          backgroundColor: Colors.red,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(passwordCheck);
                      }
                      
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: Text('Sign up',
                  style: TextStyle(fontSize: 15,
                  color: Colors.white,
                  ),
                  ),
                  ),
                  
              ),
              SizedBox(height:15),
              Text(
                'OR',
                style: TextStyle(
                  color:Colors.grey,
                ),
              ),
              SizedBox(height:15),
              Row(
                children:<Widget> [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(120, 0, 0,0),
                    child: Text(
                      "Have an account? ",
                      style: TextStyle(
                        color:Colors.grey,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.pushReplacementNamed(context, Login.id);
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.blue,
                      )
                    ),
                  )

                ],
              )

          ],
        ),
      ),
    );
  }
}