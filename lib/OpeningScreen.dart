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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        position: DecorationPosition.background,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background3.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(1), BlendMode.dstATop),
          ),
        ),
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 60),
              Icon(Mdi.handHeart, size: 125),
              Text("charitea", style: GoogleFonts.pangolin(fontSize: 70, fontWeight: FontWeight.bold,color: Color(0xFF2eb092))),
              Padding(
                  padding: const EdgeInsets.only(top: 235),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(21)),
                    padding: const EdgeInsets.only(
                        left: 30, right: 30, top: 20, bottom: 20),
                    onPressed: goToNextScreen,
                    color: Color(0xFF2eb092),
                    textColor: Colors.white,
                    child: Text(
                      "Let's get started!",
                      style: TextStyle(fontSize: 20),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
