import 'package:flutter/material.dart';
import './LoginScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mdi/mdi.dart';

class OpeningScreen extends StatefulWidget {
  OpeningScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _OpeningScreenState createState() => _OpeningScreenState();
}

class _OpeningScreenState extends State<OpeningScreen> {
  void goToNextScreen() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  final background = BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background3.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(1), BlendMode.dstATop),
          ),
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.topCenter,
          decoration: background,
          padding: EdgeInsets.all(25.0),
        child: Center(
          child: ListView(
            children: <Widget>[
              SizedBox(height: 50),
              Center(child: Icon(Mdi.handHeart, size: 125)),
              Center(child: Text("charitea", style: GoogleFonts.pangolin(fontSize: 70, fontWeight: FontWeight.bold,color: Color(0xFF2eb092)))),
              Padding(
                  padding: const EdgeInsets.only(top: 225),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(21)),
                    padding: const EdgeInsets.only(
                        left: 30, right: 30, top: 20, bottom: 20),
                    onPressed: goToNextScreen,
                    color: Color(0xFF2eb092),
                    textColor: Colors.white,
                    child: Text(
                      "LET'S GET STARTED!",
                      style: GoogleFonts.firaSans(fontSize: 20,),
                    ),
                  ))
            ],
          ),
        )
      ),
    ));
  }
}
