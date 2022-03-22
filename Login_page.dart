import 'package:flutter/material.dart';
import 'Course.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    ),
  );
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 20, 27, 34),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          Container(
            height: 120.0,
            width: 190.0,
            child: Image.asset('assets/images/flutter_sign_in.jpg'),
          ),
          Container(
            margin: EdgeInsets.only(left: 20.0),
            child: Text(
              "Sign back in",
              style: TextStyle(
                  fontSize: 30, fontFamily: 'Poppins', color: Colors.white),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15.0),
            padding: EdgeInsets.only(bottom: 20.0),
            child: Text(
              "Choose from accounts saved on this device",
              style: TextStyle(
                  fontSize: 15, fontFamily: 'Poppins', color: Colors.white),
            ),
          ),
          SizedBox(height:10.0),
                    Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                
                Column(children: [
                   InkWell(
              child: Row(
                children:[
                  Icon(Icons.person, color: Colors.blue,  size: 30.0,),
                  SizedBox(width: 10.0,),
                  Text("Nidhi Bangera",style: TextStyle( fontSize: 20,fontFamily: 'Poppins',color: Colors.white)),
                  //Text( "ph.919892902802@phone.duolingo", style: TextStyle(fontSize: 10.0,fontFamily: 'Poppins',color: Colors.white),),
                  Icon(Icons.arrow_right,color: Colors.white,size: 30.0, ),
                ]
              ),
              onTap: () {
               Navigator.push(context,MaterialPageRoute(builder: (context) =>  CoursePage()));
              }),
                ]),
                
              ]),
          Container(
              margin: EdgeInsets.only(top: 150.0),
              child: Text(
                "MANAGE   ACCOUNTS",
                style: TextStyle(
                    fontSize: 20, fontFamily: 'Poppins', color: Colors.grey),
              )),
              
        ]));
  }
}
