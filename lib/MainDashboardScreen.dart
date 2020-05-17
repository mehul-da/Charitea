import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mdi/mdi.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mdi/mdi.dart';
import './SearchTab.dart';
import './MapsTab.dart';
import './FavoritesTab.dart';

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
  int tabIndex = 0;

  _MainDashboardState(String uid) {
    this.uid = uid;
  }

  changeIndex(int index) {
    setState(() {tabIndex = index;});
  }

  List<Widget> widgetsForEachTab = <Widget> [
    SearchTab(),
    MapsTab(),
    FavoritesTab()

  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
        body: Center(
        child: widgetsForEachTab.elementAt(tabIndex),
      ),
        bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            title: Text('Maps'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Mdi.heart),
            title: Text('Favorites'),
          ),
        ],
        currentIndex: tabIndex,
        onTap: changeIndex,
        selectedItemColor: Color(0xFF2eb092),));
  }
}
