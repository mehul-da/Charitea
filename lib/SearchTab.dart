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
            child: Text("SEARCH TAB!")),
      ),
    );
  }
}
