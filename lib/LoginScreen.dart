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
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
          child: DecoratedBox(
        position: DecorationPosition.background,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.7), BlendMode.dstATop),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height:80),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.only(top: 50, bottom: 40),
                        child: Text(
                          "let's start off with a few details!",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
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
              SizedBox(height:30),
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
              SizedBox(height: 30),
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
      )),
    );
  }
}
