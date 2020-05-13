import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './VerificationScreen.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mdi/mdi.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void goToNextScreen() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => VerificationScreen()));
  }

  final background = BoxDecoration(
    image: DecorationImage(
      image: AssetImage('images/loginScreen.jpg'),
      fit: BoxFit.cover,
      colorFilter: ColorFilter.mode(
          Color.fromRGBO(0x2e, 0xb0, 0x92, 1.0).withOpacity(1),
          BlendMode.dstATop),
    ),
  );

  final phoneMessage = Text(
    "We will be sending you a code to verify your phone.",
    textAlign: TextAlign.center,
    style: GoogleFonts.nanumGothic(
        fontSize: 18, color: Colors.black),
  );

  final mainTitle = Center(
      child: Text(
    "ENTER YOUR PHONE NUMBER",
    style: GoogleFonts.nanumGothic(
        fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
  ));

  var textEditingController = TextEditingController();
  var maskTextInputFormatter = MaskTextInputFormatter(
      mask: "(###) ###-####", filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: true,
        resizeToAvoidBottomInset: true,
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
                  Center(child: Icon(Mdi.phone, size: 100)),
                  SizedBox(height: 20),
                  mainTitle,
                  SizedBox(height: 20),
                  phoneMessage,
                  SizedBox(height: 30),
                  TextField(
                      style: GoogleFonts.nanumGothic(fontSize: 20, fontWeight: FontWeight.bold),
                      controller: textEditingController,
                      inputFormatters: [maskTextInputFormatter],
                      autocorrect: false,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          hintText: "Phone Number",
                          hintStyle: GoogleFonts.nanumGothic(fontSize: 20, fontWeight: FontWeight.bold),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          contentPadding: const EdgeInsets.all(16.0),
                          prefixIcon: Icon(Mdi.numeric, color: Colors.black))),
                  SizedBox(height: 30),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(21)),
                    padding: const EdgeInsets.only(top: 17, bottom: 17, left: 30, right: 30),
                    onPressed: goToNextScreen,
                    color: Color(0xFF2eb092),
                    textColor: Colors.white,
                    child: Text(
                      "CONTINUE",
                      style: GoogleFonts.firaSans(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
