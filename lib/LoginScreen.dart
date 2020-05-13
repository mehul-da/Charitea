import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final background = BoxDecoration(
    image: DecorationImage(
      image: AssetImage('images/background2.png'),
      fit: BoxFit.cover,
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop),
    ),
  );

  final phoneInput = Container(
      width: 320,
      child: TextField(
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
            hintText: "Phone Number",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            contentPadding: const EdgeInsets.all(16.0),
            prefixIcon: Icon(Icons.phone, color: Colors.black)),
      ));

  final continueButton = RaisedButton(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(21)),
    padding: const EdgeInsets.only(top: 20, bottom: 20),
    onPressed: () => {},
    color: Color(0xFF2eb092),
    textColor: Colors.white,
    child: Text(
      "CONTINUE",
      style: GoogleFonts.firaSans(fontSize: 20),
    ),
  );

  final phoneMessage = Text(
    "We will be sending you a code to verify your phone. Standard rates may apply.",
    textAlign: TextAlign.center,
    style: GoogleFonts.nanumGothic(
        fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
  );

  final mainTitle = Center(
      child: Text(
    "ENTER YOUR PHONE NUMBER",
    style: GoogleFonts.nanumGothic(
        fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
  ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.topCenter,
            padding: EdgeInsets.all(25.0),
            child: Center(
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  mainTitle,
                  SizedBox(height: 14),
                  phoneMessage,
                  SizedBox(height: 30),
                  phoneInput,
                  SizedBox(height: 30),
                  continueButton,
                ],
              ),
            ),
          ),
        ));
  }
}
