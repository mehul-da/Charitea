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
  var charityNameController = new TextEditingController();
  var missionController = new TextEditingController();

  final background = BoxDecoration(
    image: DecorationImage(
      image: AssetImage('images/tabBackground.jpg'),
      fit: BoxFit.cover,
    ),
  );

  final mainTitle = Center(
      child: Text(
    "CHARITY SEARCH",
    style: GoogleFonts.nanumGothic(
        fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
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
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  mainTitle, 
                  SizedBox(height: 30),
                  TextField(
                      style: GoogleFonts.nanumGothic(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      autocorrect: false,
                      maxLength: 6,
                      onChanged: (text) => {},
                      controller: charityNameController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          counterText: "",
                          hintText: "Name of Organization",
                          hintStyle: GoogleFonts.nanumGothic(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          contentPadding: const EdgeInsets.all(16.0),
                          prefixIcon: Icon(Mdi.officeBuilding,
                              color: Colors.black, size: 20))),
                  SizedBox(height: 18),
                  Center(
                      child: Text("-OR-",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nanumGothic(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black))),
                  SizedBox(height: 18),
                  TextField(
                      style: GoogleFonts.nanumGothic(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      autocorrect: false,
                      maxLength: 6,
                      onChanged: (text) => {},
                      controller: missionController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          counterText: "",
                          hintText: "Mission of Organization",
                          hintStyle: GoogleFonts.nanumGothic(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          contentPadding: const EdgeInsets.all(16.0),
                          prefixIcon: Icon(Mdi.officeBuilding,
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
                        color: Color(0xFF2eb092),
                        onPressed: () => {},
                        child: Text(
                          "SEARCH",
                          style: GoogleFonts.firaSans(fontSize: 20),
                        ),
                      )),
                ],
              )),
        ));
  }
}
