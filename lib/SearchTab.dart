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
        fontSize: 27, fontWeight: FontWeight.bold, color: Colors.black),
  ));

  final descriptionMessage = Text(
    "Search up a charity or non-profit organization either by name, the mission that they support or the type of donation they accept!",
    textAlign: TextAlign.center,
    style: GoogleFonts.nanumGothic(fontSize: 19, color: Colors.black),
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
              padding: EdgeInsets.all(25.0),
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  mainTitle,
                  SizedBox(height: 20),
                  descriptionMessage,
                  SizedBox(height: 30),
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: TextField(
                            style: GoogleFonts.nanumGothic(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            autocorrect: false,
                            maxLength: 6,
                            onChanged: (text) => {},
                            controller: charityNameController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                                counterText: "",
                                hintText: "Name",
                                hintStyle: GoogleFonts.nanumGothic(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                prefixIcon: Icon(Mdi.officeBuilding,
                                    color: Colors.black, size: 20))),
                      ),
                      SizedBox(width: 10),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(21)),
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        color: Color(0xFF2eb092),
                        onPressed: () => {},
                        child: Icon(Icons.search, size: 20),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Divider(color: Colors.black),
                  SizedBox(height: 10),
                  Row(children: <Widget>[
                    Flexible(
                        child: TextField(
                            style: GoogleFonts.nanumGothic(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            autocorrect: false,
                            maxLength: 6,
                            onChanged: (text) => {},
                            controller: missionController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                                counterText: "",
                                hintText: "Mission/Services",
                                hintStyle: GoogleFonts.nanumGothic(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                prefixIcon: Icon(Mdi.officeBuilding,
                                    color: Colors.black, size: 20)))),
                    SizedBox(width: 10),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(21)),
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      color: Color(0xFF2eb092),
                      onPressed: () => {},
                      child: Icon(Icons.search, size: 20),
                    ),
                  ]),
                ],
              )),
        ));
  }
}
