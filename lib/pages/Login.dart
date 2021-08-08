import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:myinstagram/pages/Signup.dart';
import 'package:myinstagram/pages/auth_firebase.dart';
import 'package:myinstagram/pages/mainfeed.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Login extends StatefulWidget {
  static final String id= 'login';
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

String? email,password;
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
            SizedBox(height:35),
            Text(
              'MyInstagram',
              style: TextStyle(fontFamily: 'Dancing',
              fontSize: 50,
              fontWeight: FontWeight.bold,
              )
              ),
              SizedBox(height:35),
              Padding(
                padding: const EdgeInsets.all(15.0),
                
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
                padding: const EdgeInsets.all(15.0),
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
                padding: const EdgeInsets.fromLTRB(200.0,5.0,0,15.0),
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
              
              Container(
                width:300,
                child: OutlinedButton(
                  onPressed:() 
                  async { 
                    
                    await signin(email!, password!).whenComplete(() async{

                    var user = FirebaseAuth.instance.currentUser;
                    String uid = user!.uid;
                           CollectionReference users = FirebaseFirestore.instance.collection('users');
                           FirebaseAuth auth= FirebaseAuth.instance;
                           var collection = FirebaseFirestore.instance.collection('users');
                           var docSnapshot = await collection.doc(uid).get();
                           Map<String, dynamic>? data = docSnapshot.data();
                           String username = data?['username'];
                           String profilepic = data?['profilepicture'];
                           String bio = data?['bio'];
                           SharedPreferences prefs = await SharedPreferences.getInstance();
                           await prefs.setString("uid", uid);
                           await prefs.setString("username", username);
                           await prefs.setString("profilepicture", profilepic);
                           await prefs.setString("bio", bio);
                         
                    if(auth.currentUser!.uid==user.uid)
                    {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> Mainfeed(uid: user.uid,)));
                    }
                    else
                    {
                      final wrongcredentials = SnackBar(
                          duration: Duration(seconds: 1),
                          content: Text("Wrong Credentials"),
                          backgroundColor: Colors.red,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(wrongcredentials);
                        }
                    }
                    );
                    
                    },
                   
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: Text('Login',
                  style: TextStyle(fontSize: 15,
                  color: Colors.white,
                  ),
                  ),
                  ),
                  
              ),
              SizedBox(height:50),
              Text(
                'OR',
                style: TextStyle(
                  color:Colors.grey,
                ),
              ),
              SizedBox(height:50),
              Row(
                children:<Widget> [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(100, 0, 0,0),
                    child: Text(
                      "Don't have an account? ",
                      style: TextStyle(
                        color:Colors.grey,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.pushReplacementNamed(context, Signup.id);
                    },
                    child: Text(
                      "Signup",
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