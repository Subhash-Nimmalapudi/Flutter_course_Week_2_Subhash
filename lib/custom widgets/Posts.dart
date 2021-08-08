import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myinstagram/custom%20widgets/gradient_ring_widget.dart';
import 'package:like_button/like_button.dart';


class Posts extends StatelessWidget {

  final String? profileimage;
  final String? username;
  final String? time;
  final String? postimage;
  final String? caption;
   
  
  const Posts({this.profileimage,this.username,this.time,this.postimage,this.caption });
  
  @override
  Widget build(BuildContext context) {
    return  Container(
        child: Column(
          children:<Widget> [
            Row(
              children: <Widget>[
                SizedBox(width: 10,),
                WGradientRing(
                  padding: 1,
                  child: CircleAvatar(
                    radius: 25,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(profileimage!),
                      radius: 25,
                    ),
                  ),
                ),
                SizedBox(width: 5,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(username!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),),
                   Text(time!)
                  ],
                ),
              ],
            ),
            SizedBox(height:8),
            Image(image: NetworkImage(postimage!),
            width: 1080,
            height: 350,
            fit: BoxFit.cover ,
            ),
            
            SizedBox(height: 8,),
            Row(
              children: [
                SizedBox(width: 10,),
                LikeButton(
                  size: 30,
                  onTap: (isLiked) async{
                   if (!isLiked) {
  final passwordCheck = SnackBar(
    duration: Duration(seconds: 1) ,
         content: Column(
           mainAxisSize: MainAxisSize.min,
           children: [
             Center(child: Text("You Liked this Post",
             style: TextStyle(
               color: Colors.blue
             ),)),
           ],
         ),
         backgroundColor: Colors.white,
         elevation: 2,
       );
       ScaffoldMessenger.of(context).showSnackBar(passwordCheck);
       return true;
}
else{
final passwordCheck = SnackBar(
  duration: Duration(seconds: 1) ,
         content: Column(
           mainAxisSize: MainAxisSize.min,
           children: [
             Center(child: Text("You Disliked this Post",
             style: TextStyle(
               color: Colors.blue
             ),)),
           ],
         ),
         backgroundColor: Colors.white,
         elevation: 2,
       );
       ScaffoldMessenger.of(context).showSnackBar(passwordCheck);  
       
      return false;
}
                        
                  },
                  
                ),
                SizedBox(width: 10,),
                Icon(Icons.textsms_outlined,
                size: 30,),
                SizedBox(width: 16,),
                Icon(Icons.send,
                size: 30,),
              ],
            ),
            SizedBox(height:10),
            Row(
              children: [
                SizedBox(width: 5,),
            Text(username!,
            style: TextStyle(fontWeight:FontWeight.bold),
            ),
            SizedBox(width: 5,),
            Text(caption!),
              ],
            ),
            Divider()
          ],
        ),
      );
    
  }
}