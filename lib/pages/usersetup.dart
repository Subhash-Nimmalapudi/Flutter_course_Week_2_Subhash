import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


 Future<void>usersetup(String username , String email, String password) async{
   CollectionReference users = FirebaseFirestore.instance.collection('users');
   FirebaseAuth auth= FirebaseAuth.instance;
   String uid = auth.currentUser!.uid.toString();
   int followers = 0;
   int following = 0;
   users.doc(uid).set({
   'username': username , 
   'uid' : uid , 
   'email': email, 
   'password': password ,
   'profilepicture' : 'https://th.bing.com/th/id/OIP.J9ameRkhThciJESEKvadfAHaHa?pid=ImgDet&rs=1',
   'bio': '  ',
   'followers': 0,
   'following':0
    });
   return;
 }