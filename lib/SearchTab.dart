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
  String dropdownValue;
  bool showNextInput = false;

  final background = BoxDecoration(
    image: DecorationImage(
      image: AssetImage('images/tabBackground.jpg'),
      fit: BoxFit.cover,
    ),
  );

  final mainTitle = Center(
      child: Text(
    "SEARCH",
    style: GoogleFonts.nanumGothic(
        fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
  ));

  final descriptionMessage = Text(
    "Search up a charity, non-profit organization or donation event by name, the mission that they support or the type of donation they accept!",
    textAlign: TextAlign.center,
    style: GoogleFonts.nanumGothic(fontSize: 19, color: Colors.black),
  );

  @override
  Widget build(BuildContext context) {
    var nextInput;

    if (showNextInput) {
      nextInput = Row(children: <Widget>[
        Flexible(
            child: TextField(
                style: GoogleFonts.nanumGothic(
                    fontSize: 20, fontWeight: FontWeight.bold),
                autocorrect: false,
                maxLength: 60,
                onChanged: (text) => {},
                controller: missionController,
                decoration: InputDecoration(
                    counterText: "",
                    hintText: "Information/Details",
                    hintStyle: GoogleFonts.nanumGothic(
                        fontSize: 20, fontWeight: FontWeight.bold),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    focusColor: Colors.black,
                    hoverColor: Colors.black,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    prefixIcon:
                        Icon(Mdi.information, color: Colors.black, size: 20)))),
        SizedBox(width: 10),
        RaisedButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(21)),
          padding: const EdgeInsets.only(top: 15, bottom: 15),
          color: Color(0xFF2eb092),
          onPressed: () => {},
          child: Icon(Icons.search, size: 30),
        ),
      ]);
    } else {
      nextInput = SizedBox(height: 0);
    }

    return Scaffold(
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
              height: MediaQuery.of(context).size.height,
              alignment: Alignment.topCenter,
              decoration: background,
              padding: EdgeInsets.all(25.0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 19),
                  mainTitle,
                  SizedBox(height: 20),
                  descriptionMessage,
                  SizedBox(height: 30),
                  Container(
                      padding: const EdgeInsets.only(
                          top: 7, bottom: 7, left: 10, right: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        border:
                            Border.all(style: BorderStyle.solid, width: 0.75),
                      ),
                      child: DropdownButton<String>(
                          value: dropdownValue,
                          underline: SizedBox(),
                          hint: Text("Choose an option"),
                          style: GoogleFonts.nanumGothic(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue = newValue;
                              showNextInput = true;
                            });
                          },
                          items: <String>[
                            'Charity/Event Name',
                            'Mission/Services',
                            'Items Accepted'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: GoogleFonts.nanumGothic(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            );
                          }).toList())),
                  SizedBox(height: 18),
                  nextInput,
                  SizedBox(height: 15),
                  Divider(color: Colors.black),
                  SizedBox(
                    height: 15,
                  ),
                ],
              )),
        ));
  }
}
