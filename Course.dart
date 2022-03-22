import 'package:flutter/material.dart';
void main() => runApp(CoursePage());

class CoursePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  double _progressValue=0;
  final screens = [
   SingleChildScrollView(
     child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              InkWell(
                child: Container(
                  margin: EdgeInsets.only(top: 50.0),
                  height: 100.0,
                  width: 100.0,
                  child: Image.asset('assets/images/unit.jpg')),
                  onTap: (){ 
                    print("clicked");
                    //));
                  }
              ),
              Text('Unit 1',style: TextStyle(fontSize: 20,  color: Colors.white, fontFamily: 'Poppins', )),  
           
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(left:50.0),
                height: 30,
                width: 250,
                child: Image.asset('assets/images/progress.jpg')
                ),
              Text("0/40",style:TextStyle(fontSize:15,color: Colors.grey)),
            ],
          ), 
          IconButton(
             icon: Image.asset('assets/images/intro.jpg'),
             iconSize: 120,
             onPressed: () {
             },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  IconButton(
             icon: Image.asset('assets/images/phrases.jpg'),
             iconSize: 120,
             onPressed: () {},
            ),
            IconButton(
             icon: Image.asset('assets/images/travel.jpg'),
             iconSize: 120,
             onPressed: () {},
            ),
              ],
            ) 
          ]
     ),
   ),
    Center(
        child: Text('Rewards',
            style: TextStyle(fontSize: 60, color: Colors.white))
  ),
    Center(
        child: Text('Profile',
            style: TextStyle(fontSize: 60, color: Colors.white))),
    Center(
        child: Text('LeaderBoard',
            style: TextStyle(fontSize: 60, color: Colors.white))),
    Center(
        child:
            Text('Shop', style: TextStyle(fontSize: 60, color: Colors.white))),
    Center(
        child: Text('NewsFeed',
            style: TextStyle(fontSize: 60, color: Colors.white)))
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: Text("Navigation and Gestures"),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        backgroundColor: Colors.blueGrey[900],
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        iconSize: 30,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.book,
            ),
            label: 'Rewards',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shield,
            ),
            label: 'LeaderBoard',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.stream,
            ),
            label: 'Streak',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.speaker,
            ),
            label: 'News Feed',
          ),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}
