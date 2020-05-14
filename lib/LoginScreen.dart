import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './VerificationScreen.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mdi/mdi.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var enabled = false;
  var buttonColor = Color(0xFF8D8D8D);
  var textColor = Colors.black;
  String verificationId;
  String phoneNumber;


  autoRetrieve(String verId) {
    this.verificationId = verId;
    print("auto-retrieve");
  }

  codeTextSent(String verId, List<int> code) {
    this.verificationId = verId;
    Navigator.push(context,
            MaterialPageRoute(builder: (context) => VerificationScreen(phoneNum: this.phoneNumber, verId: this.verificationId)));
    print("code text sent");
  }

  verificationComplete(AuthCredential authCredential) {
    print('verification complete');
  }

  verificationFail(AuthException authException) {
    print('verification failed');
  }

  Future<void> verifyPhone(phoneNum) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNum,
        timeout: Duration(seconds: 15),
        codeAutoRetrievalTimeout: (verId) => autoRetrieve(verId),
        codeSent: (verId, [code]) => codeTextSent(verId, [code]),
        verificationCompleted: (authCredential) =>
            verificationComplete(authCredential),
        verificationFailed: (authException) => verificationFail(authException));
  }

  final background = BoxDecoration(
    image: DecorationImage(
      image: AssetImage('images/loginScreen.jpg'),
      fit: BoxFit.cover,
    ),
  );

  final phoneMessage = Text(
    "We will be sending you a code to verify your phone.",
    textAlign: TextAlign.center,
    style: GoogleFonts.nanumGothic(fontSize: 18, color: Colors.black),
  );

  final mainTitle = Center(
      child: Text(
    "ENTER YOUR PHONE NUMBER",
    style: GoogleFonts.nanumGothic(
        fontSize: 21, fontWeight: FontWeight.bold, color: Colors.black),
  ));

  var textEditingController = TextEditingController();
  var maskTextInputFormatter = MaskTextInputFormatter(
      mask: "(###) ###-####", filter: {"#": RegExp(r'[0-9]')});

  void onPhoneChange(String text) {
    if (text.length >= 14) {
      setState(() {
        enabled = true;
        buttonColor = Color(0xFF2eb092);
        textColor = Colors.white;
        phoneNumber =
            "+1${textEditingController.text.substring(1, 4)}${textEditingController.text.substring(6, 9)}${textEditingController.text.substring(10, 14)}";
      });
    } else {
      setState(() {
        enabled = false;
        buttonColor = Color(0xFF8D8D8D);
        textColor = Colors.black;
        phoneNumber = "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var goToNextScreen;
    if (enabled) {
      goToNextScreen = () {
        this.verifyPhone(this.phoneNumber);
      };
    }

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
                  Center(child: Icon(Mdi.phone, size: 85)),
                  SizedBox(height: 18),
                  mainTitle,
                  SizedBox(height: 18),
                  phoneMessage,
                  SizedBox(height: 25),
                  TextField(
                      style: GoogleFonts.nanumGothic(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      controller: textEditingController,
                      inputFormatters: [maskTextInputFormatter],
                      autocorrect: false,
                      maxLength: 14,
                      onChanged: (text) => onPhoneChange(text),
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          counterText: "",
                          hintText: "Phone Number",
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
                        onPressed: goToNextScreen,
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
