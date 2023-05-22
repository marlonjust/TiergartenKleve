import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:zoo/main.dart';
import 'package:zoo/abenteuermodus.dart';

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tiergarten Kleve',
      theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFFF8EFE9),
          appBarTheme: AppBarTheme(color: Colors.white)),
      home: Auswahl(),
    );
  }
}

class Auswahl extends StatelessWidget {
  void navigateToSecondPage(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Abenteuertour()),
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
              padding: const EdgeInsets.only(left: 107),
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
          Row(
            children: [
              Image.asset("assets/images/Logo.png", width: 125, height: 125),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
                child: Container(
                    height: 110,
                    width: 230,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Color(0xFFF8EFE9), spreadRadius: 10),
                      ],
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Hier siehst du nun alle Audioguides, such dir einen aus und wir fangen gleich an",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF640000)),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    )),
              ),
            ],
          ),
          Row(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(35, 40, 0, 0),
                    child: Container(
                      width: 225,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.white, spreadRadius: 10),
                        ],
                      ),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white)),
                        onPressed: () => navigateToSecondPage(context),
                        child: Text(
                          'Abenteuertour',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF640000)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(30, 40, 0, 0),
                    child: Row(
                      children: [
                        Icon(Icons.timer, color: Color(0xFFF47B20),size: 40),
                        Text("2,5h",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF640000)),
                          ),
                      ],
                    ),
                  ),
                ],
              )
            ]
          ),
          Row(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(35, 40, 0, 0),
                    child: Container(
                      width: 225,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.white, spreadRadius: 10),
                        ],
                      ),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white)),
                        onPressed: () => navigateToSecondPage(context),
                        child: Text(
                          'Kleine Tour',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF640000)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(30, 40, 0, 0),
                    child: Row(
                      children: [
                        Icon(Icons.timer, color: Color(0xFFF47B20),size: 40),
                        Text("2,5h",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF640000)),
                          ),
                      ],
                    ),
                  ),
                ],
              )
            ]
          ),
          Row(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(35, 40, 0, 0),
                    child: Container(
                      width: 225,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.white, spreadRadius: 10),
                        ],
                      ),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white)),
                        onPressed: () => navigateToSecondPage(context),
                        child: Text(
                          'Große Tour',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF640000)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(30, 40, 0, 0),
                    child: Row(
                      children: [
                        Icon(Icons.timer, color: Color(0xFFF47B20),size: 40),
                        Text("2,5h",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF640000)),
                          ),
                      ],
                    ),
                  ),
                ],
              )
            ]
          ),
          Row(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(35, 40, 0, 0),
                    child: Container(
                      width: 225,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.white, spreadRadius: 10),
                        ],
                      ),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white)),
                        onPressed: () => navigateToSecondPage(context),
                        child: Text(
                          'Freie Tour',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF640000)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(30, 40, 0, 0),
                    child: Row(
                      children: [
                        Icon(Icons.timer, color: Color(0xFFF47B20),size: 40),
                        Text("//",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF640000)),
                          ),
                      ],
                    ),
                  ),
                ],
              )
            ]
          ),
        ]),
      ),
    );
  }
}
