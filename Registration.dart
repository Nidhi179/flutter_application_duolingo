import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:language_picker/language_picker.dart';
import 'Languages.dart';
void main() => runApp(Register());

final GoogleSignIn _googleSignIn=GoogleSignIn(
  scopes:[
    'email'
  ]
);

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  GoogleSignInAccount? _currentUser;

  @override
  void initState(){
    _googleSignIn.onCurrentUserChanged.listen((account) { 
      setState(() {
         _currentUser=account;
      }); 
    });
    _googleSignIn.signInSilently();
    super.initState();
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          title: Text("Welcome"),
          backgroundColor: Colors.green,
        ),
        body: _buildWidget(),
      ),
    );
  }

  //Global Key

  @override
  Widget _buildWidget() {
    GoogleSignInAccount? user = _currentUser;
    if(user != null){
      return Padding(
        padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          ListTile(
            leading:  GoogleUserCircleAvatar(identity: user),
            title: Text(user.displayName ?? ' ',style: TextStyle(fontSize: 18,fontFamily:'Poppins' ,color: Colors.white),),
            subtitle: Text(user.email,style: TextStyle(fontSize: 15,fontFamily: 'Poppins',color: Colors.white)),
          ),
          SizedBox(height:20.0),
          Text('You have succesfully created an account!!',style: TextStyle(fontSize: 15,fontFamily: 'Poppins',color: Colors.grey)),
          SizedBox(height: 15.0,),
          Container(
            height: 40.0,
            width: 250.0,
            child: ElevatedButton(
               style: ElevatedButton.styleFrom(
    primary: Colors.blueGrey[900],
    side: BorderSide(width: 1.0, color: Colors.grey)/// backgrou// foreground
  ),

              onPressed:(){
               Navigator.push(context,MaterialPageRoute(builder: (context) => LangPick()));
              } , 
              child: Text('Go to the course',style: TextStyle(fontSize: 15,fontFamily: 'Poppins')))),
          Container(
            margin: EdgeInsets.only(top: 20.0),
            height: 40.0,
            width: 250.0,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
    primary: Colors.blueGrey[900],
    side: BorderSide(width: 1.0, color: Colors.grey)// backgrou// foreground
  ),
              onPressed:signOut , child: Text('Sign Out',style:TextStyle(fontSize: 15,fontFamily: 'Poppins'))))
        ],
      ),
      );
    }
    else{
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form( 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 30.0,
            ),
            Container(
              margin: EdgeInsets.only(left: 50.0),
              child: Text(
                "What's your Phone Number?",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey)),
                  margin: EdgeInsets.only(left: 10.0),
                  padding: EdgeInsets.all(13.0),
                  child: Text(
                    "+91",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        fillColor: Colors.white,
                        labelText: 'Phone Number',
                        hintText: 'Enter a Valid Phone Number',
                        labelStyle: TextStyle(color: Colors.white),
                        hintStyle: TextStyle(color: Colors.white),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      validator: (value) { 	//Validator
                        if (value != null && value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ],
            ),
            Container(
                width: 350,
                margin: EdgeInsets.only(top: 15.0, left: 20.0),
                child: 
                Padding(
                  padding:  EdgeInsets.fromLTRB(30, 2, 30, 2),
                  child: ElevatedButton(
              onPressed: () {
                  print('Button Pressed');
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              child: Text('CONTINUE',style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
                )
            ),
  
        Container(
          padding: EdgeInsets.only(left: 80.0),
          margin: EdgeInsets.only(top: 15.0),
          child: SignInButton(
  Buttons.GoogleDark,
  text: "Sign up with Google",
  onPressed: signIn,
),
        ),
Container(
  padding: EdgeInsets.only(left: 80.0),
  margin: EdgeInsets.only(top: 5.0),
          child: SignInButton(
  Buttons.FacebookNew,
  text: "Sign up with Facebook",
  onPressed: () {},
)
),
SizedBox(height: 5),
 Row(
          children: [
            SizedBox(width:80.0),
            SignInButtonBuilder(text: 'Sign up with Email',
  icon: Icons.email,
  onPressed: () {},
  backgroundColor: Colors.blueGrey[700]!,
),
          ],
        ),
          ],
         
        ),
      ),
    );
  }
}

void signOut(){
  _googleSignIn.disconnect();
}
Future<void> signIn() async{
  try{
    await _googleSignIn.signIn();
  }
  catch(e){
print('Error sigin in $e');
  }
}
}