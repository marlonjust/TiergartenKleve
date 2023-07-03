import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:zoo/audioplayer.dart';
import 'package:zoo/auswahlmenu.dart';
import 'package:zoo/abenteuertour.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';

const cream = Color(0xFFF8EFE9);
const orange = Color(0xFFF47B20);
const dorange = Color(0xFF640000);
String animalNameOne = '';
String animalNameTwo = '';
String animalNameThree = '';
bool buttonOne = false;
bool buttonTwo = false;
bool buttonThree = false;
bool buttonFour = false;
int counter = 0;

void main() {
  runApp(Freietour());
}

class Freietour extends StatefulWidget {
  const Freietour({super.key});

  @override
  State<Freietour> createState() => FreietourClass();

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tiergarten Kleve',
      theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFFF8EFE9),
          appBarTheme: AppBarTheme(color: Colors.white)),
    );
  }
}

class FreietourClass extends State<Freietour> {
  final _mapController = MapController(initMapWithUserPosition: true);
  final String animalName = '';
  List<List<dynamic>> coords = [
    ['Roter Panda', 51.7987607049, 6.12185299919],
    ['Maus', 51.7984312277, 6.12212873616],
  ];

  @override
  void navigateToAudioplayer(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Audioplayer(animalName: animalName)),
    );
  }

  void navigateToAuswahl(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Auswahl()),
    );
  }

  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  void checkLocation() {
    Timer.periodic(new Duration(seconds: 5), (timer) {
      checkDistance();
    });
  }

  void checkDistance() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    double distanceEnMetres = 10;
    for (int i = 0; i < coords.length; i++) {
      double long = position.longitude;
      double lati = position.latitude;

      distanceEnMetres = await distance2point(
          GeoPoint(latitude: lati, longitude: long),
          GeoPoint(latitude: coords[i][1], longitude: coords[i][2]));
      print(counter);
      if (distanceEnMetres <= 5) {
        if (counter == 0) {
          setState(() {
            animalNameOne = coords[i][0];
            buttonOne = true;
            counter++;
          });
          print(counter);
        } else if (counter == 1 && coords[i][0] != animalNameOne) {
          setState(() {
            animalNameTwo = coords[i][0];
            buttonTwo = true;
            counter++;
          });
          print(counter);
        }
      }
    }
  }

  void createButton(String animal) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              "assets/images/Appbar Logo.png",
              fit: BoxFit.contain,
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 90),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/FlagNE.png",
                    fit: BoxFit.contain,
                    height: 25,
                  ),
                  Image.asset(
                    "assets/images/FlagGB.png",
                    fit: BoxFit.contain,
                    height: 25,
                  ),
                  Image.asset(
                    "assets/images/FlagDE.png",
                    fit: BoxFit.contain,
                    height: 25,
                  ),
                ],
              ),
            ),
          ],
        ),
        toolbarHeight: 62,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/background.png"),
          fit: BoxFit.fill,
        )),
        child: Column(children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 0, 10),
              child: Container(
                width: 160,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.white, spreadRadius: 1),
                  ],
                ),
                child: ElevatedButton(
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor: MaterialStateProperty.all(Colors.white)),
                  onPressed: () => navigateToAuswahl(context),
                  child: Text(
                    '<< Modus ändern',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: dorange),
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            child: Container(
              height: 520,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                child: OSMFlutter(
                  controller: _mapController,
                  mapIsLoading:
                      const Center(child: CircularProgressIndicator()),
                  trackMyPosition: true,
                  initZoom: 12,
                  minZoomLevel: 4,
                  maxZoomLevel: 14,
                  stepZoom: 1.0,
                  androidHotReloadSupport: true,
                  userLocationMarker: UserLocationMaker(
                    personMarker: const MarkerIcon(
                        icon: Icon(Icons.personal_injury,
                            color: Colors.black, size: 48)),
                    directionArrowMarker: const MarkerIcon(
                        icon: Icon(Icons.location_on,
                            color: Colors.black, size: 48)),
                  ),
                  roadConfiguration:
                      const RoadOption(roadColor: Colors.blueGrey),
                  markerOption: MarkerOption(
                      defaultMarker: MarkerIcon(
                          icon: Icon(Icons.person_pin_circle,
                              color: Colors.black, size: 48))),
                  onMapIsReady: (isReady) async {
                    if (isReady) {
                      await Future.delayed(const Duration(seconds: 1),
                          () async {
                        await _mapController.currentLocation();
                        checkLocation();
                      });
                    }
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              'Tiere in der Nähe',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w400, color: cream),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: buttonOne,
                  child: Container(
                    width: 150,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: cream,
                      boxShadow: [
                        BoxShadow(color: cream, spreadRadius: 1),
                      ],
                    ),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0),
                          backgroundColor: MaterialStateProperty.all(cream)),
                      onPressed: () => navigateToAudioplayer(context),
                      child: Text(
                        animalNameOne,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: dorange),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Visibility(
                  visible: buttonTwo,
                  child: Container(
                    width: 150,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: cream,
                      boxShadow: [
                        BoxShadow(color: cream, spreadRadius: 1),
                      ],
                    ),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0),
                          backgroundColor: MaterialStateProperty.all(cream)),
                      onPressed: () => navigateToAudioplayer(context),
                      child: Text(
                        animalNameTwo,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: dorange),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Ja hier muss noch was hin so nh
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
