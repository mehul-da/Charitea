import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mdi/mdi.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:firebase_auth/firebase_auth.dart';

class VerificationScreen extends StatefulWidget {
  VerificationScreen({Key key, this.title, @required this.phoneNum}) : super(key: key);
  final String title;
  final String phoneNum;

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  var enabled = false;
  var buttonColor = Color(0xFF8D8D8D);
  var textColor = Colors.black;
  var textEditingController = TextEditingController();
  var maskTextInputFormatter =
      MaskTextInputFormatter(mask: "######", filter: {"#": RegExp(r'[0-9]')});
  String code;

  void onCodeChange(String text) {
    if (text.length >= 6) {
      setState(() {
        enabled = true;
        buttonColor = Color(0xFF2eb092);
        textColor = Colors.white;
      });
    } else {
      setState(() {
        enabled = false;
        buttonColor = Color(0xFF8D8D8D);
        textColor = Colors.black;
      });
    }
  }

  final background = BoxDecoration(
    image: DecorationImage(
      image: AssetImage('images/verificationScreen.jpg'),
      fit: BoxFit.cover,
    ),
  );

  final phoneMessage = Text(
    "We just sent a code to the number provided. Please enter it here.",
    textAlign: TextAlign.center,
    style: GoogleFonts.nanumGothic(fontSize: 18, color: Colors.black),
  );

  final mainTitle = Center(
      child: Text(
    "ENTER VERIFICATION CODE",
    style: GoogleFonts.nanumGothic(
        fontSize: 21, fontWeight: FontWeight.bold, color: Colors.black),
  ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.topCenter,
            decoration: background,
            padding: EdgeInsets.all(23.0),
            child: Center(
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  Center(child: Icon(Mdi.numeric, size: 85)),
                  SizedBox(height: 18),
                  mainTitle,
                  SizedBox(height: 18),
                  phoneMessage,
                  SizedBox(height: 25),
                  TextField(
                      style: GoogleFonts.nanumGothic(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      autocorrect: false,
                      maxLength: 6,
                      onChanged: (text) => onCodeChange(text),
                      controller: textEditingController,
                      inputFormatters: [maskTextInputFormatter],
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          counterText: "",
                          hintText: "Verification Code",
                          hintStyle: GoogleFonts.nanumGothic(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          contentPadding: const EdgeInsets.all(16.0),
                          prefixIcon: Icon(Mdi.cellphone,
                              color: Colors.black, size: 20))),
                  SizedBox(height: 30),
                  Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(21)),
                        padding: const EdgeInsets.only(
                            top: 17, bottom: 17, left: 30, right: 30),
                        onPressed: () => {},
                        color: buttonColor,
                        child: Text(
                          "CONTINUE",
                          style: GoogleFonts.firaSans(
                              fontSize: 20, color: textColor),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ));
  }
}
