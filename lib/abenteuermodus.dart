import 'package:flutter/material.dart';
import 'package:zoo/abenteuermodus.dart';
import 'package:geolocator/geolocator.dart';
import 'package:zoo/audioplayer.dart';
import 'package:zoo/main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tiergarten Kleve',
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFF8EFE9), appBarTheme: AppBarTheme(color: Colors.white)),
      home: Abenteuertour(),
    );
  }
}

class Abenteuertour extends StatelessWidget {
    void navigateToAuswahl(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Auswahl()),
    );
  }

      void navigateToAudioplayer(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Audioplayer()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Column(
            children: [
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white)),
                onPressed: () => navigateToAuswahl(context),
                child: Text(
                  '<< Zur Auswahl',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF640000)),
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white)),
                onPressed: () => navigateToAudioplayer(context),
                child: Text(
                  'Roter Panda',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF640000)),
                ),
              ),
            ],
          ),
        ),
        );
  }
}
