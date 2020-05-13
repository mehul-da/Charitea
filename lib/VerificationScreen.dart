import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VerificationScreen extends StatefulWidget {
  VerificationScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final background = BoxDecoration(
    image: DecorationImage(
      image: AssetImage('images/background.jpg'),
      fit: BoxFit.cover,
      colorFilter:
          ColorFilter.mode(Color.fromRGBO(0x2e, 0xb0, 0x92, 1.0).withOpacity(1), BlendMode.dstATop),
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
    color: Color.fromRGBO(0x2e, 0xb0, 0x92, 1.0),
    // color: Color(0xFF2eb092),
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
    "ENTER VERIFICATION CODE",
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
            decoration: background,
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