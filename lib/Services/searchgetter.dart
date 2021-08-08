import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class searchgetter extends GetxController {
  Future getdata(String collection) async{
    final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    QuerySnapshot snapshot = await firebaseFirestore.collection(collection).get();
    return snapshot.docs;
  }

  Future querydata(String querystring) async{
    return FirebaseFirestore.instance.
    collection('users').
    where('username' , isGreaterThanOrEqualTo: querystring).get();
  }
  
}