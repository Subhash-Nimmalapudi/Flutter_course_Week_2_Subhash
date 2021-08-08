
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myinstagram/pages/Authorization.dart';
import 'package:myinstagram/pages/auth_firebase.dart';
import 'package:myinstagram/pages/editPassword.dart';
import 'package:myinstagram/pages/editUsername.dart';
import 'package:myinstagram/pages/editbio.dart';
import 'package:myinstagram/pages/editprofilepic.dart';
import 'package:myinstagram/pages/mainfeed.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Editprofile extends StatefulWidget {
  const Editprofile({ Key? key }) : super(key: key);

  @override
  _EditprofileState createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '           Edit profile',
          style: TextStyle(
            color: Colors.black
          ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed:() => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> Mainfeed(uid: auth.currentUser!.uid))), 
          icon: Icon(Icons.keyboard_arrow_left,
          color: Colors.black,
          size:35,) ,
         ),
      ),
     body: ListView(
        children: [
          SizedBox(height: 20,),
          CircleAvatar(
            backgroundColor:Colors.white,
            radius: 100,
            child:StreamBuilder(
              stream:FirebaseFirestore.instance.collection('users').doc(user!.uid).snapshots() ,
              builder: (context,AsyncSnapshot<DocumentSnapshot> snapshot){
                var profilepic = snapshot.data!;
                 if(!snapshot.hasData){
             return Center(
               child: CircularProgressIndicator(),
             );
           }
                return CircleAvatar(
                  radius: 100,
                  backgroundColor:Colors.white,
                  backgroundImage:NetworkImage(profilepic['profilepicture']) ,
                );
              },
              )
          ),
          SizedBox(height: 20,),
          Divider(),
         
          ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Editprofilepic()));
            },
            title:Text(
          'Change Profile Picture',
        ),
        
          ),
          Divider(),
           ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Editbio()));
            },
            title:Text(
          'Add or Change Bio',
        ),
        
          ),
          
          Divider(),
          ListTile(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Editusername()));
            },
            title:Text(
          'Change Username',
        ),
          ),
          Divider(),
          ListTile(
            title:Text(
          'Change Password',
        ),
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Editpassword()));
        },
          ),
          Divider(),
          ListTile(
            title:Text(
          'Sign-out',
           style: TextStyle(
            color: Colors.red
          ),
        ),
        onTap: () async{
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.remove('uid');
              await prefs.remove('username');
              await prefs.remove('profilepicture');
              await prefs.remove('bio');
          signout();
          
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> Authorization()));
          },
          ),
          Divider(),
          SizedBox(height: 80,),
          
        ],
      )
      
    );
  }
}

