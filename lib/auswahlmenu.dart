import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:zoo/abenteuertour.dart';
import 'package:zoo/main.dart';
import 'package:zoo/freietour.dart';

const cream = Color(0xFFF8EFE9);
const orange = Color(0xFFF47B20);
const dorange = Color(0xFF640000);

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
  void navigateToAbenteuer(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Abenteuertour()),
    );
  }

    void navigateToFrei(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Freietour()),
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
        child: Column(children: [
          Row(
            children: [
              Image.asset("assets/images/Logo.png", width: 125, height: 125),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Container(
                    height: 110,
                    width: 230,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: cream, spreadRadius: 10),
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
                              color: dorange),
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
                    padding: const EdgeInsetsDirectional.fromSTEB(30, 40, 0, 0),
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
                        onPressed: () => navigateToAbenteuer(context),
                        child: Text(
                          'Abenteuertour',
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
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 40, 0, 0),
                    child: Row(
                      children: [
                        Icon(Icons.timer, color: orange,size: 40),
                        Text("1,5 h",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: dorange),
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
                    padding: const EdgeInsetsDirectional.fromSTEB(30, 40, 0, 0),
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
                        onPressed: () {},
                        child: Text(
                          'Kleine Tour',
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
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 40, 0, 0),
                    child: Row(
                      children: [
                        Icon(Icons.timer, color: orange,size: 40),
                        Text("1 h",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: dorange),
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
                    padding: const EdgeInsetsDirectional.fromSTEB(30, 40, 0, 0),
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
                        onPressed: () {},
                        child: Text(
                          'Große Tour',
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
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 40, 0, 0),
                    child: Row(
                      children: [
                        Icon(Icons.timer, color: orange,size: 40),
                        Text("2,5h",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: dorange),
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
                    padding: const EdgeInsetsDirectional.fromSTEB(30, 40, 0, 0),
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
                        onPressed: () => navigateToFrei(context),
                        child: Text(
                          'Freie Tour',
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
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 40, 0, 0),
                    child: Row(
                      children: [
                        Icon(Icons.timer, color: orange,size: 40),
                        Text("//",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: dorange),
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
