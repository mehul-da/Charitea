import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mdi/mdi.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MainDashboardScreen extends StatefulWidget {
  MainDashboardScreen(
      {Key key, this.title, @required this.userUID})
      : super(key: key);
  final String title;
  final String userUID;

  @override
  _MainDashboardState createState() =>
      _MainDashboardState(this.userUID);
}

class _MainDashboardState extends State<MainDashboardScreen> {
  String uid;

  _MainDashboardState(String uid) {
    this.uid = uid;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Text("HELLO")
        ),
        bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('School'),
          ),
        ],));
        
  }
}
