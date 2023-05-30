import 'package:flutter/material.dart';
import 'package:zoo/abenteuermodus.dart';
import 'package:zoo/auswahlmenu.dart';
import 'package:audioplayers/audioplayers.dart';

const cream = Color(0xFFF8EFE9);
const orange = Color(0xFFF47B20);
const dorange = Color(0xFF640000);
const animalName = "Roter Panda";

void main() {
  runApp(AudioplayerClass());
}

class AudioplayerClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tiergarten Kleve',
      theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFFF8EFE9),
          appBarTheme: AppBarTheme(color: Colors.white)),
      home: Audioplayer(),
    );
  }
}

class Audioplayer extends StatelessWidget {
  void navigateToSecondPage(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MyApp2()),
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
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/background.png"),
          fit: BoxFit.fill,
        )),
        child: Align(
            alignment: Alignment.topLeft,
            child: IntrinsicHeight(
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.arrow_back, color: Color(0xFF640000), size: 40),
                      Expanded(
                        child: Text(
                          "Roter Panda",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: dorange),
                        ),
                      ),
                    ],
                  ),
                  Row(children: [
                    ElevatedButton(child: Text("Press"), onPressed:(){
                      final player=AudioPlayer();
                      player.play(AssetSource("assets/audios/test.mp3"));
                    },)
                  ],

                  ),
                ],
              ),
            )),
      ),
    );
  }
}
