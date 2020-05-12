import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        position: DecorationPosition.background,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/background.jpg'), fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.only(top: 70, bottom: 40),
                        child: Text(
                          "LET'S GET A FEW DETAILS!", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                        ))
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        width: 270,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Name",
                            border: OutlineInputBorder(),
                            contentPadding: const EdgeInsets.all(16.0),
                          ),
                        ))
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        width: 270,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Name",
                            border: OutlineInputBorder(),
                            contentPadding: const EdgeInsets.all(16.0),
                          ),
                        ))
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        width: 270,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Name",
                            border: OutlineInputBorder(),
                            contentPadding: const EdgeInsets.all(16.0),
                          ),
                        ))
                  ]),
              Padding(
                  padding: const EdgeInsets.only(top: 400),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    padding: const EdgeInsets.only(
                        left: 30, right: 30, top: 15, bottom: 15),
                    onPressed: () => {},
                    color: Colors.black,
                    textColor: Colors.white,
                    child: Text(
                      "I'M READY!",
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
