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
            image: AssetImage('images/background3.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.7), BlendMode.dstATop),
          ),
        ),
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 130),
              Icon(Mdi.tea, size: 125),
              Text("chariTEA", style: GoogleFonts.pangolin(fontSize: 70, color: Colors.red, fontWeight: FontWeight.bold)),
              Padding(
                  padding: const EdgeInsets.only(top: 160),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(21)),
                    padding: const EdgeInsets.only(
                        left: 30, right: 30, top: 20, bottom: 20),
                    onPressed: goToNextScreen,
                    color: Colors.red,
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
