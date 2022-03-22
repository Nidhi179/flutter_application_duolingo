import 'package:flutter/material.dart';
import 'package:language_picker/languages.dart';
import 'package:language_picker/language_picker.dart';
import 'Course.dart';
void main() => runApp(LangPick());

class LangPick extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Language _selectedDialogLanguage = Languages.english;

  Widget _buildDialogItem(Language language) => Row(
        children: <Widget>[
          Text(language.name),
          SizedBox(width: 8.0),
          Flexible(child: Text("(${language.isoCode})"))
        ],
      );

  void _openLanguagePickerDialog() => showDialog(
        context: context,
        builder: (context) => Theme(
            data: Theme.of(context).copyWith(primaryColor: Colors.pink),
            child: LanguagePickerDialog(
                titlePadding: EdgeInsets.all(8.0),
                searchCursorColor: Colors.pinkAccent,
                searchInputDecoration: InputDecoration(hintText: 'Search...'),
                isSearchable: true,
                title: Text('Select any one'),
                onValuePicked: (Language language) => setState(() {
                      _selectedDialogLanguage = language;
                      print(_selectedDialogLanguage.name);
                      print(_selectedDialogLanguage.isoCode);
                    }),
                itemBuilder: _buildDialogItem)),
      );

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: Text("Complete your profile",style: TextStyle(fontSize: 18, color: Colors.white,fontFamily:"Poppins")),
      ),
      body:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                  child: Container(
                    child: MaterialButton(
                      child: Row(
                        children: [
                          SizedBox(width: 10,),
                          Text("Select Language you want to learn",style: TextStyle(fontFamily: "Poppins",fontSize: 19.0,color: Colors.white),),
                          Icon(Icons.arrow_drop_down,size: 28,color: Colors.white,)
                        ],
                      ),
                      onPressed: _openLanguagePickerDialog,
                    ),
                  ),
                ),
            SizedBox(height:20.0),
              Container(
            height: 40.0,
            width: 250.0,
            child: ElevatedButton(
               style: ElevatedButton.styleFrom(
    primary: Colors.blueGrey[900],
    side: BorderSide(width: 1.0, color: Colors.grey)/// backgrou// foreground
  ),
              onPressed:(){
               Navigator.push(context,MaterialPageRoute(builder: (context) => CoursePage()));
              } , 
              child: Text('Start learning ${_selectedDialogLanguage.name}',style: TextStyle(fontSize: 15,fontFamily: 'Poppins'))))
             
            ]), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}