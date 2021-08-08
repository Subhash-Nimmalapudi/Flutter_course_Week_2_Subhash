import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myinstagram/pages/Login.dart';
import 'package:myinstagram/pages/Signup.dart';


class Authorization extends StatefulWidget {

  static final String id= 'authorization';
  @override
  _AuthorizationState createState() => _AuthorizationState();
}

class _AuthorizationState extends State<Authorization> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:<Widget>[
            SizedBox(height:100),
            Text(
              'MyInstagram',
              style: TextStyle(fontFamily: 'Dancing',
              fontSize: 50,
              fontWeight: FontWeight.bold,
              )
              ),
              SizedBox(height:150),
              Container(
                width:300,
                child: OutlinedButton(
                  onPressed:() => Navigator.pushReplacementNamed(context, Login.id),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: Text('Log in',
                  style: TextStyle(fontSize: 15,
                  color: Colors.white,
                  ),
                  ),
                  ),
                  
              ),
              SizedBox(height:30),
              Container(
                width: 300,
                child: OutlinedButton(
                  onPressed:(){
                     Navigator.pushReplacementNamed(context, Signup.id);
                  },
                  style: OutlinedButton.styleFrom(
                    onSurface: Colors.blue,
                  ),
                  child: Text('Sign Up',
                  style: TextStyle(fontSize: 15,
                  color: Colors.blue,
                  ),
                  ),
                  ),
                  
              )

          ],
        ),
      ),
    );
  }
}