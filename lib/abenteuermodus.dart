import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:zoo/abenteuermodus.dart';
import 'package:zoo/audioplayer.dart';
import 'package:zoo/auswahlmenu.dart';
import 'package:geolocator/geolocator.dart';

const cream = Color(0xFFF8EFE9);
const orange = Color(0xFFF47B20);
const dorange = Color(0xFF640000);
const animalName = '';

void main() {
  runApp(Abenteuertour());
}

class Abenteuertour extends StatefulWidget {
  const Abenteuertour({super.key});

  @override
  State<Abenteuertour> createState() => AbenteuertourClass();

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

class AbenteuertourClass extends State<Abenteuertour> {
  final _mapController = MapController(initMapWithUserPosition: true);

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  void checkLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(GeolocatorPlatform.instance.distanceBetween(position.latitude,
        position.longitude, position.latitude, position.longitude));
  }

  void checkDistance() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(GeolocatorPlatform.instance.distanceBetween(position.latitude,
        position.longitude, position.latitude, position.longitude));
  }

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
              padding: const EdgeInsets.only(left: 70),
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
                  onPressed: () {},
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
              height: 440,
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
                Selectbutton(),
                SizedBox(width: 20),
                Selectbutton(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Selectbutton(),
                SizedBox(width: 20),
                Selectbutton(),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class Selectbutton extends StatelessWidget {
    void navigateToSecondPage(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Audioplayer()),
    );
  }

  const Selectbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        onPressed: () => navigateToSecondPage(context),
        child: Text(
          animalName,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w400, color: dorange),
        ),
      ),
    );
  }
}
