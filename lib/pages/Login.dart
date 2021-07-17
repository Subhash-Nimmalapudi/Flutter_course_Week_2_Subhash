
import 'package:flutter/material.dart';
import 'package:myinstagram/pages/Signup.dart';
import 'package:myinstagram/pages/mainfeed.dart';


class Login extends StatefulWidget {
  static final String id= 'login';
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:<Widget>[
            SizedBox(height:50),
            Text(
              'MyInstagram',
              style: TextStyle(fontFamily: 'Dancing',
              fontSize: 50,
              fontWeight: FontWeight.bold,
              )
              ),
              SizedBox(height:50),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
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
                  onPressed:() => Navigator.pushNamed(context, Mainfeed.id),
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
                      Navigator.pushNamed(context, Signup.id);
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