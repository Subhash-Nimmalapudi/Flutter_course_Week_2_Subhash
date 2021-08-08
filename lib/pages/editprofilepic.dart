import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class Editprofilepic extends StatefulWidget {
  const Editprofilepic({ Key? key }) : super(key: key);

  @override
  _EditprofilepicState createState() => _EditprofilepicState();
}

class _EditprofilepicState extends State<Editprofilepic> {
  String? password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '             Edit Profilepicture',
          style: TextStyle(
            color: Colors.black
          ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed:() => Navigator.pop(context), 
          icon: Icon(Icons.keyboard_arrow_left,
          color: Colors.black,
          size:35,) ,
         ),
      ),
      body: ListView(children: [
        SizedBox(height: 30,),
        SizedBox(height:10),
           
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Current Password'),
                  onChanged: (value){
                    setState(() {
                      password=value.trim();
                    });
                  },
                ),
              ),
              Divider(),
        ListTile(
          title: Text('Open Camera'),
          onTap:()async{
            String profilepic = await uploadprofilepicturecamera();
            CollectionReference users = FirebaseFirestore.instance.collection('users');
                   FirebaseAuth auth= FirebaseAuth.instance;
                   var collection = FirebaseFirestore.instance.collection('users');
                   var docSnapshot = await collection.doc(auth.currentUser!.uid).get();
                   Map<String, dynamic>? data = docSnapshot.data();
                  String currentpassword = data?['password'];
                  

                  if(password == currentpassword)
                   {
                    
                    await users.doc(auth.currentUser!.uid).update({
                    'profilepicture' : profilepic,
                    
                    }
                    );
                    
                    Navigator.pop(context);
                   }
          } ,
        ),
        Divider(),
        ListTile(
          title: Text('Open Gallery'),
          onTap:()async{
            String profilepic = await uploadprofilepicturegallery();
            CollectionReference users = FirebaseFirestore.instance.collection('users');
                   FirebaseAuth auth= FirebaseAuth.instance;
                   var collection = FirebaseFirestore.instance.collection('users');
                   var docSnapshot = await collection.doc(auth.currentUser!.uid).get();
                   Map<String, dynamic>? data = docSnapshot.data();
                  String currentpassword = data?['password'];
                 

                  if(password == currentpassword)
                   {
                    
                    await users.doc(auth.currentUser!.uid).update({
                    'profilepicture' : profilepic,
                    
                    }
                    );
                    
                    Navigator.pop(context);
                   }
          } ,
        ),
        Divider(),
        ListTile(
          title: Text('Remove Profilepicture'),
         onTap:()async{
            
            CollectionReference users = FirebaseFirestore.instance.collection('users');
                   FirebaseAuth auth= FirebaseAuth.instance;
                   var collection = FirebaseFirestore.instance.collection('users');
                   var docSnapshot = await collection.doc(auth.currentUser!.uid).get();
                   Map<String, dynamic>? data = docSnapshot.data();
                  String currentpassword = data?['password'];
                  

                  if(password == currentpassword)
                   {
                    
                    await users.doc(auth.currentUser!.uid).update({ 
                     
                    'profilepicture' : 'https://th.bing.com/th/id/OIP.J9ameRkhThciJESEKvadfAHaHa?pid=ImgDet&rs=1',
                    
                    }
                    );
                    
                    Navigator.pop(context);
                   }
          } ,
        ),
        Divider(),
      ],)
    );
  }
}

Future<String> uploadprofilepicturegallery() async{
  FirebaseAuth auth= FirebaseAuth.instance;
  final picker = ImagePicker();
  XFile profilepicture;
  
  await Permission.photos.request();
  var permissionstatus = await Permission.photos.status;

  if(permissionstatus.isGranted){
    
    profilepicture = (await picker.pickImage(source: ImageSource.gallery))! ;

    var file = File(profilepicture.path);
    FirebaseStorage storage = FirebaseStorage.instanceFor(bucket:"gs://myinstagram-1c0cc.appspot.com" );

    

      var profilepicref = storage.ref().child("${auth.currentUser!.uid}/profilepicture");

      var uploadtask = await profilepicref.putFile(file);
      String profilepicurl = await uploadtask.ref.getDownloadURL();

      return profilepicurl;
    
  }

  return 'https://th.bing.com/th/id/OIP.J9ameRkhThciJESEKvadfAHaHa?pid=ImgDet&rs=1';
}

Future<String> uploadprofilepicturecamera() async{
  FirebaseAuth auth= FirebaseAuth.instance;
  FirebaseStorage storage = FirebaseStorage.instanceFor(bucket:"gs://myinstagram-1c0cc.appspot.com" );
  final picker = ImagePicker();
  XFile profilepicture;
  
  await Permission.photos.request();
  var permissionstatus = await Permission.photos.status;

  if(permissionstatus.isGranted){
    
    profilepicture = (await picker.pickImage(source: ImageSource.camera))!;

    var file = File(profilepicture.path);

    

      var profilepicref =storage.ref().child("${auth.currentUser!.uid}/profilepicture");

      var uploadtask = await profilepicref.putFile(file);
      String profilepicurl = await uploadtask.ref.getDownloadURL();

      return profilepicurl;
    
  }

  return 'https://th.bing.com/th/id/OIP.J9ameRkhThciJESEKvadfAHaHa?pid=ImgDet&rs=1';
}