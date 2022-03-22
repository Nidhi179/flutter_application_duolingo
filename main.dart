import 'package:flutter/material.dart';
import 'Registration.dart';
import 'Login_page.dart';
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 22, 29, 32),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          Container(
            margin: EdgeInsets.only(left: 15.0),
            height: 120.0,
            width: 190.0,
            child: Image.asset('assets/images/flutter_sign_in.jpg'),
          ),
          Container(
            margin:EdgeInsets.only(left: 25.0),
           child:Text(
            "duolingo",
            style: TextStyle(
                fontSize: 30, fontFamily: 'Poppins', color: Color.fromARGB(255, 64, 219, 69)),
          ),
           )
          ,
          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: Text(
              "Learn a language for free forever",
              style: TextStyle(
                  fontSize: 23,
                  fontFamily: 'Open Sans Condensed',
                  color: Colors.grey),
            ),
          ),
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Container(
              margin: EdgeInsets.fromLTRB(30,25,0,0),
              child: OutlinedButton(
                child: Text(
                  "GET STARTED",
                  style: TextStyle(fontSize: 20.0,color:Color.fromARGB(255, 64, 219, 69) ),
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 1.0, color: Color.fromARGB(255, 70, 65, 65)),
                padding: EdgeInsets.all(10),
                  ),
                onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) =>  Register()),
                  );
                },
                ),
              
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.only(left: 35.0),
              child: OutlinedButton(
                child: Text( "I ALDREADY HAVE AN ACCOUNT",
                  style: TextStyle(fontSize: 20.0,color:Color.fromARGB(255, 64, 219, 69) ),
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 1.0, color: Colors.grey),
                  padding: EdgeInsets.all(10)
                  ),
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) =>  LoginPage()),
                  );
                },
              ),
            )
          ])
        ]));
  }
}
