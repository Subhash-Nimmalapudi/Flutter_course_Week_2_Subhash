import 'package:flutter/material.dart';
import 'package:myinstagram/pages/Login.dart';
import 'package:myinstagram/pages/mainfeed.dart';

class Signup extends StatefulWidget {
  static final String id= 'signup';
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
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
              SizedBox(height:50),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Username'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Confirm password'),
                  obscureText: true,
                ),
              ),
              Container(
                width:300,
                child: OutlinedButton(
                  onPressed:() => Navigator.pushNamed(context, Mainfeed.id),
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
                      Navigator.pushNamed(context, Login.id);
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