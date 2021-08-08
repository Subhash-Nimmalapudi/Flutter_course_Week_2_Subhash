import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myinstagram/pages/auth_firebase.dart';

class Editpassword extends StatefulWidget {
  const Editpassword({ Key? key }) : super(key: key);

  @override
  _EditpasswordState createState() => _EditpasswordState();
}

class _EditpasswordState extends State<Editpassword> {

  String? password,npassword,cnpassword;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '             Edit Password',
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
      body: Center(
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.center,
          children:<Widget>[
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
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'New Password'),
                  onChanged: (value){
                    setState(() {
                      npassword=value.trim();
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Confirm new Password'),
                  
                  onChanged: (value){
                    setState(() {
                      cnpassword=value.trim();
                    });
                  },
                ),
              ),
              SizedBox(height: 30,),
              Container(
                width:300,
                child: OutlinedButton(
                  onPressed:() async{
                   CollectionReference users = FirebaseFirestore.instance.collection('users');
                   FirebaseAuth auth= FirebaseAuth.instance;
                   var collection = FirebaseFirestore.instance.collection('users');
                   var docSnapshot = await collection.doc(auth.currentUser!.uid).get();
                   Map<String, dynamic>? data = docSnapshot.data();
                  String currentpassword = data?['password'];
                  String username = data?['username'];
                  String email = data?['email'];
                  String profilepicture = data?['profilepicture'];
                  String bio = data?['bio'];
                   if(password == currentpassword && npassword==cnpassword)
                   {
                    await auth.currentUser!.updatePassword(npassword!);
                    await users.doc(auth.currentUser!.uid).update({ 
                    
                    'password': npassword,
                    
                    });
                    
                    Navigator.pop(context);
                   }
                   else{
                      final unmatched = SnackBar(
                          duration: Duration(seconds: 1),
                          content: Text("Validate you entries"),
                          backgroundColor: Colors.red,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(unmatched);
                   }
                      
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: Text('Update',
                  style: TextStyle(fontSize: 15,
                  color: Colors.white,
                  ),
                  ),
                  ),
                  
              ),
        
          ]
      )
    )
    );
  }
}