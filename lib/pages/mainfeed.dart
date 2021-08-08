import 'dart:io';
import 'package:get/state_manager.dart';
import 'package:myinstagram/Services/searchgetter.dart';
import 'package:myinstagram/pages/profilepage.dart';
import 'package:random_string/random_string.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myinstagram/custom widgets/gradient_ring_widget.dart';
import 'package:myinstagram/custom%20widgets/Posts.dart';
import 'package:myinstagram/pages/Chats.dart';
import 'package:myinstagram/pages/editprofile.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Mainfeed extends StatefulWidget {
  final String? uid;
  Mainfeed({Key? key, @required this.uid}) : super(key: key);

  @override
  _MainfeedState createState() => _MainfeedState(uid);
}

class _MainfeedState extends State<Mainfeed> {
  final String? uid;
  final TextEditingController searchcontroller = TextEditingController();
  QuerySnapshot? snapshotdata;
  bool isExcecuted= false;
  @override
  _MainfeedState(this.uid);
  int _cindex = 0;
  // ignore: non_constant_identifier_names

  String? username = '', bio = '  ', description = ' ', profilepic = '';
  void initState() {
    getusername();
  }

  getusername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username');
      bio = prefs.getString('bio');
      profilepic = prefs.getString('profilepicture');
    });
  }

  @override
  Widget build(BuildContext context) {

    Widget searchdata(){
      return Container(
        
        child: ListView.builder(
          itemCount: snapshotdata!.docs.length,
          itemBuilder: (BuildContext context, int index){
            if(snapshotdata!.docs[index]['username']!=username)
            {return GestureDetector(
              onTap:()=> Navigator.of(context).push(MaterialPageRoute(builder: (context)=> 
              profilepage(fuid:snapshotdata!.docs[index]['uid'],uid: uid,username:snapshotdata!.docs[index]['username']))),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage : NetworkImage(snapshotdata!.docs[index]['profilepicture']),
                  
                ),
                title: Text(
                  snapshotdata!.docs[index]['username'],
                ),
              ),
            );}
            else{
              return Container(height: 0,width: 0,);
            }
          }
          ),
      );
    }

    var tabs = [
      Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 10),
                      Container(
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 10),
                            WGradientRing(
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.white,
                                child: Icon(Icons.add),
                                foregroundColor: Colors.black,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Add story',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 10),
                            WGradientRing(
                              padding: 1,
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    AssetImage('assets/images/loki.jpg'),
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Loki',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 10),
                            WGradientRing(
                              padding: 1,
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    AssetImage('assets/images/beast.jpg'),
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Beast',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 10),
                            WGradientRing(
                              padding: 1,
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage(
                                    'assets/images/captain-america.jpg'),
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'captain',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 10),
                            WGradientRing(
                              padding: 1,
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    AssetImage('assets/images/hulk.jpg'),
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'hulk',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 10),
                            WGradientRing(
                              padding: 1,
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    AssetImage('assets/images/ironman.jpg'),
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'ironman',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 10),
                            WGradientRing(
                              padding: 1,
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    AssetImage('assets/images/spiderman.jpg'),
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'spidey',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 10),
                            WGradientRing(
                              padding: 1,
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    AssetImage('assets/images/thor.jpg'),
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Thor',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 10),
                            WGradientRing(
                              padding: 1,
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    AssetImage('assets/images/wolverine.jpg'),
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'wolverine',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
              ),
              Divider(),
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('posts')
                    .orderBy('time', descending: true)
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      DocumentSnapshot post = snapshot.data!.docs[index];
                      if (post['uid'] != uid) {
                        return Posts(
                          profileimage: post.get('profilepic'),
                          username: post.get('username'),
                          postimage: post.get('post'),
                          caption: post.get('caption'),
                          time: post['time'],
                        );
                      }
                      return Container(height: 0);
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
     isExcecuted  ? searchdata():SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: <Widget>[
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                SizedBox(width: 10),
                OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    'IGTV',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                ),
                SizedBox(width: 10),
                OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    'Shop',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                ),
                SizedBox(width: 10),
                OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    'Fashion',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                ),
                SizedBox(width: 10),
                OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    'Tech',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                ),
                SizedBox(width: 10),
                OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    'Style',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                ),
                SizedBox(width: 10),
                OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    'Movies',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                ),
                SizedBox(width: 10),
                OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    'Auto',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                ),
                SizedBox(width: 10),
                OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    'Games',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('posts')
                .where('uid', isNotEqualTo: uid)
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              return GridView.builder(
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
            },
          ),
        ]),
      ),
      Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
              child: TextFormField(
                decoration:
                    InputDecoration(labelText: '+Add description to your post'),
                onChanged: (value) {
                  setState(() {
                    description = value.trim();
                  });
                },
              ),
            ),
            GestureDetector(
              onTap: () async {
                CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  color: Colors.blue,
                );
                String posturl = await camerapost();
                CollectionReference users =
                    FirebaseFirestore.instance.collection('posts');
                FirebaseAuth auth = FirebaseAuth.instance;
                String uid = auth.currentUser!.uid.toString();
                users.doc().set({
                  'username': username,
                  'uid': uid,
                  'time':
                      '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year} / ${DateTime.now().hour}:${DateTime.now().minute}',
                  'likes': 0,
                  'post': posturl,
                  'caption': description,
                  'profilepic': profilepic
                });
                setState(() {
                  _cindex = 4;
                });
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Card(
                  shadowColor: Colors.black,
                  elevation: 15,
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.white10, Colors.white])),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Open Camera',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 80,
                              ),
                              Icon(
                                Icons.camera_alt_outlined,
                                size: 80,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () async {
                CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  color: Colors.blue,
                );
                String posturl = await gallerypost();
                CollectionReference users =
                    FirebaseFirestore.instance.collection('posts');
                FirebaseAuth auth = FirebaseAuth.instance;
                String uid = auth.currentUser!.uid.toString();
                users.doc().set({
                  'username': username,
                  'uid': uid,
                  'time':
                      '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year} / ${DateTime.now().hour}:${DateTime.now().minute}',
                  'likes': 0,
                  'post': posturl,
                  'caption': description,
                  'profilepic': profilepic
                });

                setState(() {
                  _cindex = 4;
                });
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Card(
                  shadowColor: Colors.black,
                  elevation: 15,
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.white10, Colors.white])),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.photo_album_outlined,
                                size: 80,
                              ),
                              SizedBox(width: 80),
                              Text(
                                'Open Gallery',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'No New Notifications',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(uid)
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
           Text(
                  "    ${bio!}",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Container(
                width: 350,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => Editprofile()));
                  },
                  child: Text(
                    'Edit Profile',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('posts').where('uid',isEqualTo: uid)
                  
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                else{
                return GridView.builder(
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
    ];
    var appbars = [
      AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.camera_alt, color: Colors.black, size: 27,),
          onPressed: () async{
           
                CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  color: Colors.blue,
                );
                String posturl = await camerapost();
                CollectionReference users =
                    FirebaseFirestore.instance.collection('posts');
                FirebaseAuth auth = FirebaseAuth.instance;
                String uid = auth.currentUser!.uid.toString();
                users.doc().set({
                  'username': username,
                  'uid': uid,
                  'time':
                      '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year} / ${DateTime.now().hour}:${DateTime.now().minute}',
                  'likes': 0,
                  'post': posturl,
                  'caption': description,
                  'profilepic': profilepic
                });
                setState(() {
                  _cindex = 4;
                });
          }

          ),
        centerTitle: true,
        title: Text('MyInstagram',
            style: TextStyle(
              fontFamily: 'Dancing',
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Chats.id);
              },
              icon: Icon(
                Icons.send,
                color: Colors.black,
                size: 35,
              ))
        ],
      ),
      AppBar(
        leading: IconButton(onPressed: (){
          setState(() {
            isExcecuted = false;
          });
        
        }, 
        icon: Icon(Icons.arrow_left_sharp,
        color: Colors.black,)
        ),
        backgroundColor: Colors.white,
        actions: [
          GetBuilder<searchgetter>(
            init: searchgetter(),

            builder: (val){
              return IconButton(
                onPressed: () async{
                  return val.querydata(searchcontroller.text).then((value) {
                    snapshotdata = value;
                    setState(() {
                      isExcecuted = true;
                    });

                  });
                }, 
                icon: Icon(Icons.search,
        color: Colors.black,)
                );
            }
            )
        ],
        title: Center(
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Search',
              isDense: true,
              contentPadding: EdgeInsets.all(8),
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 2),
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
            ),
            controller: searchcontroller,
            cursorColor: Colors.grey,
          ),
        ),
      ),
      AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'Add Post',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'Notifications',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      AppBar(
        backgroundColor: Colors.white,
        title: Center(
          
          
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 20,
                  height: 1,
                ),
                Icon(
                  Icons.lock,
                  color: Colors.black,
                  size: 15,
                ),
                SizedBox(width: 5, height: 1),
                Text(
                        username!,
                        style: TextStyle(color: Colors.black),
                      ),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.black,
                ),
              ],
            ),
          
        ),
      ),
    ];
    return Scaffold(
      
      appBar: appbars[_cindex],
      body: tabs[_cindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _cindex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: " ",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: " ",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_to_photos_outlined),
            label: " ",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_sharp),
            label: " ",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.portrait),
            label: " ",
          ),
        ],
        onTap: (index) {
          setState(() {
            _cindex = index;
          });
        },
      ),
    );
  }
}

Future<String> gallerypost() async {
  FirebaseAuth auth = FirebaseAuth.instance;
  final picker = ImagePicker();
  XFile post;

  await Permission.photos.request();
  var permissionstatus = await Permission.photos.status;

  if (permissionstatus.isGranted) {
    post = (await picker.pickImage(source: ImageSource.gallery))!;
    CircularProgressIndicator(
      backgroundColor: Colors.white,
      color: Colors.blue,
    );
    var file = File(post.path);
    FirebaseStorage storage = FirebaseStorage.instanceFor(
        bucket: "gs://myinstagram-1c0cc.appspot.com");

    var postref =
        storage.ref().child('${auth.currentUser!.uid}/${randomString(10)}');

    var uploadtask = await postref.putFile(file);
    String posturl = await uploadtask.ref.getDownloadURL();

    return posturl;
  }

  return 'https://th.bing.com/th/id/OIP.J9ameRkhThciJESEKvadfAHaHa?pid=ImgDet&rs=1';
}

Future<String> camerapost() async {
  FirebaseAuth auth = FirebaseAuth.instance;

  final picker = ImagePicker();
  XFile post;

  await Permission.photos.request();
  var permissionstatus = await Permission.photos.status;

  if (permissionstatus.isGranted) {
    post = (await picker.pickImage(source: ImageSource.camera))!;
    CircularProgressIndicator(
      backgroundColor: Colors.white,
      color: Colors.blue,
    );
    var file = File(post.path);
    FirebaseStorage storage = FirebaseStorage.instanceFor(
        bucket: "gs://myinstagram-1c0cc.appspot.com");

    var postref =
        storage.ref().child("${auth.currentUser!.uid}/${randomString(10)}");

    var uploadtask = await postref.putFile(file);
    String posturl = await uploadtask.ref.getDownloadURL();

    return posturl;
  }

  return 'https://th.bing.com/th/id/OIP.J9ameRkhThciJESEKvadfAHaHa?pid=ImgDet&rs=1';
}
