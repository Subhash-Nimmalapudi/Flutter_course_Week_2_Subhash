import 'package:flutter/material.dart';
import 'package:myinstagram/pages/mainfeed.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Chats extends StatefulWidget {
  
  static final String id= 'Chats';

  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  
  
  String? username = '', bio = '', description = ' ', profilepic = '';
  
  void initState() {
    getusername();
  }

  getusername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username');
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.add,
            color: Colors.black,),
          )
        ],
        leading: IconButton(
          onPressed:() => Navigator.pop(context), 
          icon: Icon(Icons.keyboard_arrow_left,
          color: Colors.black,
          size:35,) ,
         ),
        title: Center(
          child: Row(
            children:[
              SizedBox(width: 63),
              Text(username!,
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
      body: 
      ListView(
        scrollDirection: Axis.vertical,
        children: [
          
          Padding(
            padding: const EdgeInsets.all(10.0),
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
             ListTile(
               leading:CircleAvatar(
                 backgroundColor: Colors.blue,
                 radius: 30,
                 backgroundImage: AssetImage('assets/images/ironman.jpg'),
               ),
               title: Text(
                 'Ironman'
               ),
               subtitle: Text(
                 "How's going buddy!"
               ),
               trailing: Icon(Icons.camera_alt_outlined),

             ),
             ListTile(
               leading:CircleAvatar(
                 backgroundColor: Colors.blue,
                 radius: 30,
                 backgroundImage: AssetImage('assets/images/thor.jpg'),
               ),
               title: Text(
                 'Thor Almighty'
               ),
               subtitle: Text(
                 'Saw my HAMMER??'
               ),
               trailing: Icon(Icons.camera_alt_outlined),

             ),
             ListTile(
               leading:CircleAvatar(
                 backgroundColor: Colors.blue,
                 radius: 30,
                 backgroundImage: AssetImage('assets/images/spiderman.jpg'),
               ),
               title: Text(
                 'Spidey'
               ),
               subtitle: Text(
                 'Need a suggestion to flirt with MJ'
               ),
               trailing: Icon(Icons.camera_alt_outlined),

             ),
             ListTile(
               leading:CircleAvatar(
                 backgroundColor: Colors.blue,
                 radius: 30,
                 backgroundImage: AssetImage('assets/images/loki.jpg'),
               ),
               title: Text(
                 'Loki'
               ),
               subtitle: Text(
                 "Could you hide Thor's hammer!!"
               ),
               trailing: Icon(Icons.camera_alt_outlined),

             ),
             ListTile(
               leading:CircleAvatar(
                 backgroundColor: Colors.blue,
                 radius: 30,
                 backgroundImage: AssetImage('assets/images/beast.jpg'),
               ),
               title: Text(
                 'Beast'
               ),
               subtitle: Text(
                 'Logan is mad!!'
               ),
               trailing: Icon(Icons.camera_alt_outlined),

             ),
             ListTile(
               leading:CircleAvatar(
                 backgroundColor: Colors.blue,
                 radius: 30,
                 backgroundImage: AssetImage('assets/images/wolverine.jpg'),
               ),
               title: Text(
                 'Wolverine'
               ),
               subtitle: Text(
                 'Tell Beast not to try Jean..'
               ),
               trailing: Icon(Icons.camera_alt_outlined),

             ),
             ListTile(
               leading:CircleAvatar(
                 backgroundColor: Colors.blue,
                 radius: 30,
                 backgroundImage: AssetImage('assets/images/hulk.jpg'),
               ),
               title: Text(
                 'Hulk'
               ),
               subtitle: Text(
                 'AAAARRRRHHHHHHHHHH'
               ),
               trailing: Icon(Icons.camera_alt_outlined),

             ),
             ListTile(
               leading:CircleAvatar(
                 backgroundColor: Colors.blue,
                 radius: 30,
                 backgroundImage: AssetImage('assets/images/captain-america.jpg'),
               ),
               title: Text(
                 'Captain'
               ),
               subtitle: Text(
                 'How to change my profile name??'
               ),
               trailing: Icon(Icons.camera_alt_outlined),

             ),
             ListTile(
               leading:CircleAvatar(
                 backgroundColor: Colors.blue,
                 radius: 30,
                 backgroundImage: AssetImage('assets/images/5.jfif'),
               ),
               title: Text(
                 'Natasha'
               ),
               subtitle: Text(
                 'Hmmmmmm'
               ),
               trailing: Icon(Icons.camera_alt_outlined),

             ),
             ListTile(
               leading:CircleAvatar(
                 backgroundColor: Colors.blue,
                 radius: 30,
                 backgroundImage: AssetImage('assets/images/9.jfif'),
               ),
               title: Text(
                 'Yeneffer'
               ),
               subtitle: Text(
                 'hello...are you there!'
               ),
               trailing: Icon(Icons.camera_alt_outlined),

             ),
             ListTile(
               leading:CircleAvatar(
                 backgroundColor: Colors.blue,
                 radius: 30,
                 backgroundImage: AssetImage('assets/images/11.jfif'),
               ),
               title: Text(
                 'Ciri of Cintra'
               ),
               subtitle: Text(
                 'Going to Kear Morhan'
               ),
               trailing: Icon(Icons.camera_alt_outlined),

             ),
             ListTile(
               leading:CircleAvatar(
                 backgroundColor: Colors.black,
                 radius: 30,
                 
               ),
               title: Text(
                 'Anonymous'
               ),
               subtitle: Text(
                 "'Guess who's this??'"
               ),
               trailing: Icon(Icons.camera_alt_outlined),

             ),
        ],),
    );
  }
}