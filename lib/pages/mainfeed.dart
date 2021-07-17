import 'package:flutter/material.dart';
import 'package:myinstagram/custom widgets/gradient_ring_widget.dart';
import 'package:myinstagram/custom%20widgets/Posts.dart';
import 'package:myinstagram/pages/Chats.dart';

class Mainfeed extends StatefulWidget {
  static final String id='mainfeed';

  @override
  _MainfeedState createState() => _MainfeedState();
}

class _MainfeedState extends State<Mainfeed> {
  
  int _cindex=0;
  // ignore: non_constant_identifier_names
  

  
   @override
  Widget build(BuildContext context) {
    var tabs = [
    Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
      child: Column(
      children: [Container(
  child: SingleChildScrollView(
    scrollDirection: Axis.horizontal,
  child: Row(
    children: <Widget>[
      SizedBox(width:10),
      Container(
        child: Column(
          children: <Widget>[
            SizedBox(height:10),
            WGradientRing(
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: Icon(Icons.add),
                foregroundColor: Colors.black,
              ),
            ),
            SizedBox(height:2),
            Text(
              'Add story',
              style:TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
      SizedBox(width:10),
      Container(
        child: Column(
          children: <Widget>[
            SizedBox(height:10),
            WGradientRing(
              padding: 1,
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/loki.jpg'),
                
              ),
            ),
            SizedBox(height:2),
            Text(
              'Loki',
              style:TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
      SizedBox(width:10),
      Container(
        child: Column(
          children: <Widget>[
            SizedBox(height:10),
            WGradientRing(
              padding: 1,
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/beast.jpg'),
              ),
            ),
            SizedBox(height:2),
            Text(
              'Beast',
              style:TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
      SizedBox(width:10),
      Container(
        child: Column(
          children: <Widget>[
            SizedBox(height:10),
            WGradientRing(
              padding: 1,
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/captain-america.jpg'),
              ),
            ),
            SizedBox(height:2),
            Text(
              'captain',
              style:TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
      SizedBox(width:10),
      Container(
        child: Column(
          children: <Widget>[
            SizedBox(height:10),
            WGradientRing(
              padding: 1,
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/hulk.jpg'),
              ),
            ),
            SizedBox(height:2),
            Text(
              'hulk',
              style:TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
      SizedBox(width:10),
      Container(
        child: Column(
          children: <Widget>[
            SizedBox(height:10),
            WGradientRing(
              padding: 1,
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/ironman.jpg'),
              ),
            ),
            SizedBox(height:2),
            Text(
              'ironman',
              style:TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
      SizedBox(width:10),
      Container(
        child: Column(
          children: <Widget>[
            SizedBox(height:10),
            WGradientRing(
              padding: 1,
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/spiderman.jpg'),
              ),
            ),
            SizedBox(height:2),
            Text(
              'spidey',
              style:TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
      SizedBox(width:10),
      Container(
        child: Column(
          children: <Widget>[
            SizedBox(height:10),
            WGradientRing(
              padding: 1,
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/thor.jpg'),
              ),
            ),
            SizedBox(height:2),
            Text(
              'Thor',
              style:TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
      SizedBox(width:10),
      Container(
        child: Column(
          children: <Widget>[
            SizedBox(height:10),
            WGradientRing(
              padding:1,
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/wolverine.jpg'),
              ),
            ),
            SizedBox(height:2),
            Text(
              'wolverine',
              style:TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
      SizedBox(width:10),
    ],

  ),
  ),
      ),
      Divider(),
       SizedBox(height: 5,),
       Posts(
        profileimage:'assets/images/wolverine.jpg',
      username:"Wolverine",
      location:"St.Xaviers Institute",
      postimage:"assets/images/610216.jpg",
      caption:"With the GANG!"),

       SizedBox(height: 20,),
       Posts(
        profileimage:'assets/images/ironman.jpg',
      username:"Ironman",
      location:"Stark Mansion",
      postimage:"assets/images/p1.jfif",
      caption:"I am IRONMAN"),

       SizedBox(height: 20,),
       Posts(
        profileimage:'assets/images/thor.jpg',
      username:"Thor Almighty",
      location:"Wakanda",
      postimage:"assets/images/p8.jfif",
      caption:"Should have gone for head!!"),

       SizedBox(height: 20,),
       Posts(
        profileimage:'assets/images/captain-america.jpg',
      username:"Captain",
      location:"Avengers facility,New York",
      postimage:"assets/images/p3.jfif",
      caption:"Thor's Gift, love you Thor"),

       SizedBox(height: 20,),
       Posts(
        profileimage:'assets/images/hulk.jpg',
      username:"THE HULK",
      location:"New York",
      postimage:"assets/images/p4.jfif",
      caption:"You know a secret?? I am always angry!"),

       SizedBox(height: 20,),
       Posts(
        profileimage:'assets/images/loki.jpg',
      username:"Loki",
      location:"TVA",
      postimage:"assets/images/p5.jfif",
      caption:"F**k you TVA"),

       SizedBox(height: 20,),
       Posts(
        profileimage:'assets/images/spiderman.jpg',
      username:"Spidey",
      location:"Europe",
      postimage:"assets/images/p6.jfif",
      caption:"I am not Peter Parker"),

       SizedBox(height: 20,),
       Posts(
        profileimage:'assets/images/beast.jpg',
      username:"Beast",
      location:"St.Xaviers Institute",
      postimage:"assets/images/p2.jfif",
      caption:"Liked my new haircut?? Ofcourse you should!"),

       SizedBox(height: 20,),
       Posts(
        profileimage:'assets/images/ironman.jpg',
      username:"Ironman",
      location:"New York",
      postimage:"assets/images/p9.jfif",
      caption:"Want some cheeseburgers!!"),

       SizedBox(height: 20,),
       Posts(
        profileimage:'assets/images/thor.jpg',
      username:"Thor Almighty",
      location:"Asgard",
      postimage:"assets/images/p7.jfif",
      caption:"Busy saving Asgard"),
      ],
      
      ),
      ),
  ),
  SingleChildScrollView(
    scrollDirection: Axis.vertical,
   child: Column(
      children:<Widget>[
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
         child:Row(
        children:<Widget>[
          SizedBox(width:10),
          OutlinedButton(
            onPressed: (){},
            child: Text('IGTV',
            style: TextStyle(
            color: Colors.black,
            ),
            ),
            style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ), 
          ),
          SizedBox(width:10),
          OutlinedButton(
            onPressed: (){},
            child: Text('Shop',
            style: TextStyle(
            color: Colors.black,
            ),
            ),
            style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ), 
          ),
          SizedBox(width:10),
          OutlinedButton(
            onPressed: (){},
            child: Text('Fashion',
            style: TextStyle(
            color: Colors.black,
            ),
            ),
            style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ), 
          ),
          SizedBox(width:10),
          OutlinedButton(
            onPressed: (){},
            child: Text('Tech',
            style: TextStyle(
            color: Colors.black,
            ),
            ),
            style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ), 
          ),
          SizedBox(width:10),
          OutlinedButton(
            onPressed: (){},
            child: Text('Style',
            style: TextStyle(
            color: Colors.black,
            ),
            ),
            style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ), 
          ),
          SizedBox(width:10),
          OutlinedButton(
            onPressed: (){},
            child: Text('Movies',
            style: TextStyle(
            color: Colors.black,
            ),
            ),
            style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ), 
          ),
          SizedBox(width:10),
          OutlinedButton(
            onPressed: (){},
            child: Text('Auto',
            style: TextStyle(
            color: Colors.black,
            ),
            ),
            style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ), 
          ),
          SizedBox(width:10),
          OutlinedButton(
            onPressed: (){},
            child: Text('Games',
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
        Container(
          height: 700,
          
            child: GridView(
              physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1,
              crossAxisSpacing: 3,
              mainAxisSpacing: 3,
              ),
              children: [
                Image(image: AssetImage('assets/images/10.jfif',
                ),
                fit: BoxFit.fill,),
                 Image(image: AssetImage('assets/images/11.jfif'),
                 fit: BoxFit.fill,),
                 Image(image: AssetImage('assets/images/7.jfif',
                ),
                fit: BoxFit.fill,),
                Image(image: AssetImage('assets/images/13.jfif',
                ),
                fit: BoxFit.fill,),
                Image(image: AssetImage('assets/images/8.jfif',
                ),
                fit: BoxFit.fill,),
                Image(image: AssetImage('assets/images/4.jfif',
                ),
                fit: BoxFit.fill,),
                Image(image: AssetImage('assets/images/2.jfif',
                ),
                fit: BoxFit.fill,),
                Image(image: AssetImage('assets/images/12.jfif',
                ),
                fit: BoxFit.fill,),
                Image(image: AssetImage('assets/images/9.jfif',
                ),
                fit: BoxFit.fill,),
                Image(image: AssetImage('assets/images/6.jfif',
                ),
                fit: BoxFit.fill,),
                Image(image: AssetImage('assets/images/3.jfif',
                ),
                fit: BoxFit.fill,),
                Image(image: AssetImage('assets/images/15.jpg',
                ),
                fit: BoxFit.fill,),
                Image(image: AssetImage('assets/images/14.jpg',
                ),
                fit: BoxFit.fill,),
                Image(image: AssetImage('assets/images/5.jfif',
                ),
                fit: BoxFit.fill,),
                Image(image: AssetImage('assets/images/1.jfif',
                ),
                fit: BoxFit.fill,),
              ],
              ),
          
        ),
      ]
    ),
  ),
    
  
  Container(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Center(
        child: OutlinedButton(
          onPressed: (){},
          child: Text('Make a post'),
        ),
      ),
    ],
  ),
  ),
  Container(
  child: ListView(
    scrollDirection: Axis.vertical,
    children: [
      SizedBox(height: 10,),
  Text('   Follow requests',
  style: TextStyle(fontWeight: FontWeight.bold,
  fontSize: 15),),
        SizedBox(height: 10,),
  Divider(),
  Text('   New',
  style: TextStyle(fontWeight: FontWeight.bold,
  fontSize: 15),),
        SizedBox(height: 10,),
  ListTile(
    leading: CircleAvatar(
      backgroundImage:AssetImage('assets/images/spiderman.jpg'),
      radius: 25,
    ),
    title: Text('Spidey liked your post',
  style: TextStyle(
  fontSize: 14),),
    subtitle: Text('1h',
  style: TextStyle(
  fontSize: 13),),
  trailing: Image(image: AssetImage('assets/images/b7.jfif',),
  ),
  ),
  Divider(),
  Text('   Today',
  style: TextStyle(fontWeight: FontWeight.bold,
  fontSize: 15),),
  ListTile(
    leading: CircleAvatar(
      backgroundImage:AssetImage('assets/images/ironman.jpg'),
      radius: 25,
    ),
    title: Text('Ironman tagged you in a post',
  style: TextStyle(
  fontSize: 14),),
    subtitle: Text('10h',
  style: TextStyle(
  fontSize: 13),),
  trailing: Image(image: AssetImage('assets/images/p9.jfif')),
  ),
  ListTile(
    leading: CircleAvatar(
      backgroundImage:AssetImage('assets/images/thor.jpg'),
      radius: 25,
    ),
    title: Text('Thor Almighty sent you a post',
  style: TextStyle(
  fontSize: 14),),
    subtitle: Text('11h',
  style: TextStyle(
  fontSize: 13),),
  trailing: OutlinedButton(onPressed: (){},
   child: Text('Message',
   style: TextStyle(
     color: Colors.black
   ),),
   ),
  ),
  Divider(),
  Text('   This week',
  style: TextStyle(fontWeight: FontWeight.bold,
  fontSize: 15),),
  ListTile(
    leading: CircleAvatar(
      backgroundImage:AssetImage('assets/images/loki.jpg'),
      radius: 25,
    ),
    title: Text('Loki started following you',
  style: TextStyle(
  fontSize: 14),),
  trailing: OutlinedButton(onPressed: (){},
   child: Text('Message',
   style: TextStyle(
     color: Colors.black
   ),),
   ),  
  
  ),
  SizedBox(height: 5,),
  ListTile(
    leading: CircleAvatar(
      backgroundImage:AssetImage('assets/images/wolverine.jpg'),
      radius: 25,
    ),
    title: Text('Wolverine started following you',
  style: TextStyle(
  fontSize: 14),),
  trailing: OutlinedButton(onPressed: (){},
   child: Text('Message',
   style: TextStyle(
     color: Colors.black
   ),),
   ),  
  
  ),
  SizedBox(height: 5,),
  ListTile(
    leading: CircleAvatar(
      backgroundImage:AssetImage('assets/images/beast.jpg'),
      radius: 25,
    ),
    title: Text('Beast started following you',
  style: TextStyle(
  fontSize: 14),),
  trailing: OutlinedButton(onPressed: (){},
   child: Text('Message',
   style: TextStyle(
     color: Colors.black
   ),),
   ),  
  
  ),
  SizedBox(height: 5,),
  ListTile(
    leading: CircleAvatar(
      backgroundImage:AssetImage('assets/images/hulk.jpg'),
      radius: 25,
    ),
    title: Text('Hulk started following you',
  style: TextStyle(
  fontSize: 14),),
  trailing: OutlinedButton(onPressed: (){},
   child: Text('Message',
   style: TextStyle(
     color: Colors.black
   ),),
   ),  
  
  ),
  SizedBox(height: 5,),
  ListTile(
    leading: CircleAvatar(
      backgroundImage:AssetImage('assets/images/captain-america.jpg'),
      radius: 25,
    ),
    title: Text('Captain started following you',
  style: TextStyle(
  fontSize: 14),),
  trailing: OutlinedButton(onPressed: (){},
   child: Text('Message',
   style: TextStyle(
     color: Colors.black
   ),),
   ),  
  
  ),
  SizedBox(height: 5,),
  ListTile(
    leading: CircleAvatar(
      backgroundImage:AssetImage('assets/images/thor.jpg'),
      radius: 25,
    ),
    title: Text('Thor started following you',
  style: TextStyle(
  fontSize: 14),),
   trailing: OutlinedButton(onPressed: (){},
   child: Text('Message',
   style: TextStyle(
     color: Colors.black
   ),),
   ),
  
  ),
  SizedBox(height: 5,),
  ],
  
  ),
  ),
  SingleChildScrollView(
    scrollDirection: Axis.vertical,
  child:Column(
    crossAxisAlignment: CrossAxisAlignment.start,
     children: [
      SizedBox(height:10),
      Row(
      children: [
        SizedBox(width: 5,),
        CircleAvatar(
          radius:45,
          backgroundColor: Colors.blue,
          backgroundImage: AssetImage('assets/images/b3.jfif'),
        ),
        SizedBox(width:30,),
        Column(
          children: [
            Text('15',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 19
            ),),
            Text('Posts',
            style: TextStyle(
              color: Colors.black,
              
            ),)
          ],
        ),
        SizedBox(width: 30,),
        Column(
          children: [
            Text('999M',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 19
            ),),
            Text('Followers',
            style: TextStyle(
              color: Colors.black,
              
            ),)
          ],
        ),
        SizedBox(width:30,),
        Column(
          children: [
            Text('00',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 19
            ),),
            Text('Following',
            style: TextStyle(
              color: Colors.black,
              
            ),)
          ],
        ),
      ],
      ),
      SizedBox(height: 15,),
      Text('  Brahmaanandam'),
      Text('  Alias Gajala,Jayasurya,Jilebi ..etc'),
      Text('  Actor'),
      Text('  Comedian'),
      SizedBox(height: 15,),
      Center(
        child: Container(
          width: 350,
          child: OutlinedButton(
            onPressed: (){},
            child: Text('Edit Profile',
            style: TextStyle(
              color: Colors.black
            ),),
          ),
        ),
      ),
      SizedBox(height: 15,),
      Container(
          height: 665,
          child: GridView(
           physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
            ),
            children: [
              Image(image: AssetImage('assets/images/b10.jfif',
              ),
              fit: BoxFit.fill,),
               Image(image: AssetImage('assets/images/b11.jfif'),
               fit: BoxFit.fill,),
               Image(image: AssetImage('assets/images/b7.jfif',
              ),
              fit: BoxFit.fill,),
              Image(image: AssetImage('assets/images/b13.jfif',
              ),
              fit: BoxFit.fill,),
              Image(image: AssetImage('assets/images/b8.jfif',
              ),
              fit: BoxFit.fill,),
              Image(image: AssetImage('assets/images/b4.jfif',
              ),
              fit: BoxFit.fill,),
              Image(image: AssetImage('assets/images/b2.jfif',
              ),
              fit: BoxFit.fill,),
              Image(image: AssetImage('assets/images/b12.jfif',
              ),
              fit: BoxFit.fill,),
              Image(image: AssetImage('assets/images/b9.jfif',
              ),
              fit: BoxFit.fill,),
              Image(image: AssetImage('assets/images/b6.jfif',
              ),
              fit: BoxFit.fill,),
              Image(image: AssetImage('assets/images/b3.jfif',
              ),
              fit: BoxFit.fill,),
              Image(image: AssetImage('assets/images/b15.jfif',
              ),
              fit: BoxFit.fill,),
              Image(image: AssetImage('assets/images/b14.jfif',
              ),
              fit: BoxFit.fill,),
              Image(image: AssetImage('assets/images/b5.jfif',
              ),
              fit: BoxFit.fill,),
              Image(image: AssetImage('assets/images/b1.jfif',
              ),
              fit: BoxFit.fill,),
            ],
            ),
        ),
      
    ],
      
  ),
  ),
  ];
    var appbars = [
    AppBar(
      
        backgroundColor: Colors.white,
       leading: Icon(Icons.camera_alt,
       color: Colors.black,
       size: 27),
       centerTitle: true,
       title: Text(
              'MyInstagram',
              style: TextStyle(fontFamily: 'Dancing',
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              )
              ),
        actions: <Widget>[
          IconButton(
            onPressed:(){
          Navigator.pushNamed(context, Chats.id);
          },
           icon: Icon(Icons.send,
           color: Colors.black,
           size: 35,)
           )
        ],
      ),
      AppBar(
        backgroundColor: Colors.white,
        leading: Icon(Icons.search_outlined,
        color: Colors.black,),
        title: Center(
          child: TextField(
            decoration: InputDecoration(labelText: 'Search',
             isDense:true,
             contentPadding: EdgeInsets.all(8),
             border: OutlineInputBorder(
               borderSide: BorderSide(width: 2),
               borderRadius: BorderRadius.all(Radius.circular(30)),
               
             ),
             ),
             cursorColor: Colors.grey,
             ),
        ),
        
      ),
      AppBar(
        backgroundColor: Colors.white,
      title: Text('               Add Post',
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold
      ),),

      ),
      AppBar(
        backgroundColor: Colors.white,
      title: Text('             Notifications',
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold
      ),),
      ),
      AppBar(
      backgroundColor: Colors.white,
        title: Center(
          child: Row(
            children:[
              SizedBox(width: 50,),
              Icon(Icons.lock,
              color: Colors.black,
              size: 15,),
              SizedBox(width:5),
              Text('Brahmi_007',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize:20
              ),),
              Icon(Icons.keyboard_arrow_down,
              color: Colors.black,),
              SizedBox(width:5),
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
            label: " " ,
            
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: " " ,
            
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.add_to_photos_outlined),
            label: " " ,
            
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.favorite_sharp),
            label: " " ,
            
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.portrait),
            label: " " ,
            
            ),
        ],
        onTap: (index){
          setState(() {
            _cindex=index;
          });
        },

      ),
      

      
    );
  }
}