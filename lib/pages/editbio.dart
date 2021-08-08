import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Editbio extends StatefulWidget {
  const Editbio({ Key? key }) : super(key: key);

  @override
  _EditbioState createState() => _EditbioState();
}

class _EditbioState extends State<Editbio> {
  String? password,nbio;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text(
          '             Edit Bio',
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
                  decoration: InputDecoration(labelText: 'New Bio'),
                  onChanged: (value){
                    setState(() {
                      nbio=value.trim();
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
                    
                   if(password == currentpassword)
                   {
                    
                    await users.doc(auth.currentUser!.uid).update({
                    'bio' : nbio
                    });
                    
                    Navigator.pop(context);
                   }
                   else{
                      final unmatched = SnackBar(
                          duration: Duration(seconds: 1),
                          content: Text("Check your password"),
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