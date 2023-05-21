import 'package:flutter/material.dart';
import 'package:zoo/abenteuermodus.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tiergarten Kleve',
      theme: new ThemeData(
          scaffoldBackgroundColor: const Color(0xFFF8EFE9),
          appBarTheme: AppBarTheme(color: Colors.white)),
      home: Introduction(),
    );
  }
}

class Introduction extends StatelessWidget {
  void navigateToSecondPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Auswahl()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20, 50, 20, 300),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Hallo, ich bin heute dein Audioguideführer",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF640000)),
                textAlign: TextAlign.center,
              ),
              Text(
                "Heute erwarten dich viele spannende und interessante Fakten über die Bewohner des Tiergartens.",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF640000)),
                textAlign: TextAlign.center,
              ),
              Text(
                "Wähle im nächsten Schritt eine Tour aus!",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF640000)),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white)),
                onPressed: () => navigateToSecondPage(context),
                child: Text(
                  'Zur Auswahl',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF640000)),
                ),
              ),
            ],
          ),
        ));
  }
}

class Auswahl extends StatelessWidget {
  void navigateToAbenteuer(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Abenteuertour()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 400),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Hier siehst du nun alle Audioguides, such dir einen aus und wir fangen gleich an",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF640000)),
                textAlign: TextAlign.center,
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white)),
                onPressed: () => navigateToAbenteuer(context),
                child: Text(
                  'Abenteuertour',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF640000)),
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white)),
                onPressed: () {},
                child: Text(
                  'Kleine Tour',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF640000)),
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white)),
                onPressed: () {},
                child: Text(
                  'Große Tour',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF640000)),
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white)),
                onPressed: () {},
                child: Text(
                  'Freie Tour',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF640000)),
                ),
              ),
            ],
          ),
        ));
  }
}
