import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class profilepage extends StatefulWidget {
  final String? fuid, uid , username;
  const profilepage({Key? key, @required this.fuid, @required this.uid,@required this.username})
      : super(key: key);

  @override
  _profilepageState createState() => _profilepageState(fuid, uid , username);
}

class _profilepageState extends State<profilepage> {
  final String? fuid, uid ,username;
  bool isfollowing = false;

  @override
  _profilepageState(this.fuid, this.uid , this.username);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_left,
          color: Colors.black,),
        onPressed:() => Navigator.pop(context), ),
        backgroundColor: Colors.white,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: Text(username! ,
            
                          style: TextStyle(color: Colors.black),),
          ),
        )
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(fuid)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                var profile = snapshot.data!;
                return Container(
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    SizedBox(
                      width: 15,
                    ),
                    CircleAvatar(
                      radius: 55,
                      backgroundColor: Colors.blue,
                      backgroundImage: NetworkImage(profile['profilepicture']),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Column(
                      children: [
                        Text(
                          profile['followers'].toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                        Text(
                          'Followers',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 45,
                    ),
                    Column(
                      children: [
                        Text(
                          profile['following'].toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                        Text(
                          'Following',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ]),
                );
              },
            ),
            SizedBox(
              height: 15,
            ),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(fuid)
                  .snapshots(),
              builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                var profilepic = snapshot.data!;
                return Text(
                  "    ${profilepic['bio']}",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                );
              },
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Container(
                width: 350,
                child: OutlinedButton(
                    onPressed: () async {
                      CollectionReference users =
                            FirebaseFirestore.instance.collection('users');
                        var collection =
                            FirebaseFirestore.instance.collection('users');
                        var docSnapshot1 = await collection.doc(fuid).get();
                        var docSnapshot2 = await collection.doc(uid).get();
                        Map<String, dynamic>? data1 = docSnapshot1.data();
                        Map<String, dynamic>? data2 = docSnapshot2.data();
                        int followers = data1?['followers'];
                        int followering = data2?['following'];
                      if (followers == 0) {
                        
                        followers++;
                        
                        followering++;
                        await users.doc(fuid).update({'followers': followers});
                        await users.doc(uid).update({'following': followering});
                        setState(() {
                        isfollowing = !isfollowing;
                      });
                      } else {
                        followers--;
                        followering--;
                        await users.doc(fuid).update({'followers': followers});
                        await users.doc(uid).update({'following': followering});
                        setState(() {
                        isfollowing = !isfollowing;
                      });
                      }
                      
                      
                    },
                    child: isfollowing == false
                        ? (Text(
                            'Follow',
                            style: TextStyle(color: Colors.blue),
                          ))
                        : (Text(
                            'Unfollow',
                            style: TextStyle(color: Colors.red),
                          ))),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('posts').where('uid',isEqualTo: fuid)
                  
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
               else
                {return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                  ),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    DocumentSnapshot post = snapshot.data!.docs[index];

                    
                      return Image(
                        image: NetworkImage(post['post']),
                        width: 300,
                        height: 300,
                        fit: BoxFit.cover,
                      );
                   
                  },
                );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
