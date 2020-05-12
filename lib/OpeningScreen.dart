import 'package:flutter/material.dart';
import './LoginScreen.dart';

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
            image: AssetImage('images/back.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(top: 400),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    padding: const EdgeInsets.only(
                        left: 30, right: 30, top: 15, bottom: 15),
                    onPressed: goToNextScreen,
                    color: Colors.red,
                    textColor: Colors.white,
                    child: Text(
                      "let's get started!",
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
