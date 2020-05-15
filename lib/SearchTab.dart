import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mdi/mdi.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mdi/mdi.dart';

class SearchTab extends StatefulWidget {
  SearchTab({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  final background = BoxDecoration(
    image: DecorationImage(
      image: AssetImage('images/tabBackground.jpg'),
      fit: BoxFit.cover,
    ),
  );

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
                  Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(21)),
                        padding: const EdgeInsets.only(
                            top: 17, bottom: 17, left: 30, right: 30),
                        color: Color(0xFF2eb092),
                        onPressed: () => {},
                        child: Text(
                          "CONTINUE",
                          style: GoogleFonts.firaSans(fontSize: 20),
                        ),
                      )),
                ],
              ))),
        ));
  }
}
