import 'package:flutter/material.dart';
import 'package:zoo/abenteuermodus.dart';
import 'package:geolocator/geolocator.dart';
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
      home: Audioplayer(),
    );
  }
}

class Audioplayer extends StatelessWidget {
    void navigateToAuswahl(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Row(
            children: [
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color(0xFFF8EFE9))),
                onPressed: () => navigateToAuswahl(context),
                child: Text(
                  '<<',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF640000)),
                ),
              ),
              Text(
                "Roter Panda",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF640000)),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        );
  }
}