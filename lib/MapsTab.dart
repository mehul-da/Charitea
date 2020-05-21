import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mdi/mdi.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mdi/mdi.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsTab extends StatefulWidget {
  MapsTab({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MapsTabState createState() => _MapsTabState();
}

class _MapsTabState extends State<MapsTab> {
  final background = BoxDecoration(
    image: DecorationImage(
      image: AssetImage('images/tabBackground.jpg'),
      fit: BoxFit.cover,
    ),
  );

  GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

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
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
            ),
          ),
        ));
  }
}
