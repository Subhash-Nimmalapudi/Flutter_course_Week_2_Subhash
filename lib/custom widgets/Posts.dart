import 'package:flutter/material.dart';
import 'package:myinstagram/custom%20widgets/gradient_ring_widget.dart';
import 'package:like_button/like_button.dart';
import 'package:get/get.dart';

class Posts extends StatelessWidget {

  final String? profileimage;
  final String? username;
  final String? location;
  final String? postimage;
  final String? caption;

  const Posts({this.profileimage,this.username,this.location,this.postimage,this.caption });

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
                    backgroundImage: AssetImage(profileimage!),
                    radius: 25,
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
                    Text(location!,
                    style: TextStyle(
                      fontSize: 13,
                    ),),
                  ],
                ),
              ],
            ),
            SizedBox(height:8),
            Image(image: AssetImage(postimage!),
            width: 1080,
            height: 350,
            fit: BoxFit.fill,
            ),
            
            SizedBox(height: 8,),
            Row(
              children: [
                SizedBox(width: 10,),
                LikeButton(
                  size: 30,
                  
                ),
                SizedBox(width: 10,),
                Icon(Icons.textsms_outlined,
                size: 30,),
                SizedBox(width: 10,),
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
          ],
        ),
      );
    
  }
}