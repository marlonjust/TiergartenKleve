import 'package:flutter/material.dart';
import 'package:zoo/abenteuertour.dart';
import 'package:zoo/auswahlmenu.dart';

const cream = Color(0xFFF8EFE9);
const orange = Color(0xFFF47B20);
const dorange = Color(0xFF640000);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tiergarten Kleve',
      theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFFF8EFE9),
          appBarTheme: AppBarTheme(color: Colors.white)),
      home: Introduction(),
    );
  }
}

class Introduction extends StatelessWidget {
  void navigateToSecondPage(BuildContext context) {
    Navigator.pushReplacement( context, MaterialPageRoute(builder: (context) => MyApp2()),
    );
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
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(30, 70, 30, 0),
          child: Column(
            children: <Widget>[
              Image.asset('assets/images/Logo.png', width: 200, height: 200),
              Text(
                "Hallo, ich bin heute dein Audioguideführer",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF640000)),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
                child: Container(
                  child: Text(
                    "Heute erwarten dich viele spannende und interessante Fakten über die Bewohner des Tiergartens.",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: dorange),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
                child: Container(
                  width: 400,
                  child: Text(
                    "Wähle im nächsten Schritt eine Tour aus!",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: dorange),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 180),
                child: Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: cream, spreadRadius: 10),
                    ],
                  ),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xFFF8EFE9))),
                    onPressed: () => navigateToSecondPage(context),
                    child: Text(
                      'Zur Auswahl',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: dorange),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}