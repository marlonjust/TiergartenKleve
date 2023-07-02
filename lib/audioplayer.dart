import 'package:flutter/material.dart';
import 'package:zoo/abenteuertour.dart';
import 'package:zoo/auswahlmenu.dart';
import 'package:audioplayers/audioplayers.dart';

const cream = Color(0xFFF8EFE9);
const orange = Color(0xFFF47B20);
const dorange = Color(0xFF640000);


class Audioplayer extends StatefulWidget {
  final String animalName;
  Audioplayer({required this.animalName});

  @override
  State<Audioplayer> createState() => AudioplayerClass();

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

class AudioplayerClass extends State<Audioplayer> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inMinutes.remainder(60));

    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(":");
  }

  void navigateToSecondPage(BuildContext context) {
    audioPlayer.pause();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Abenteuertour()),
    );
  }

  @override
  void initState() {
    super.initState();

    setAudio();

    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  Future setAudio() async{
    String animalNameSpace = animalName.replaceAll(' ', '');
    audioPlayer.setSourceAsset("audios/"+animalNameSpace+".mp3");
    print(animalName);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
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
                        ElevatedButton(
                            onPressed: () => navigateToSecondPage(context),
                            style: ButtonStyle(
                                elevation: MaterialStateProperty.all(0),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent)),
                            child: Icon(
                              Icons.arrow_back,
                              color: Color(0xFF640000),
                              size: 35,
                            ))
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset("assets/images/$animalName.png",
                              width: 325,
                              height: 250,
                              fit: BoxFit.cover),
                        ),
                        SizedBox(height: 25),
                        Text(
                          animalName,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Slider(
                          min: 0,
                          max: duration.inSeconds.toDouble(),
                          value: position.inSeconds.toDouble(),
                          activeColor: Color(0xFFF47B20),
                          inactiveColor: Color.fromARGB(255, 237, 201, 174),
                          onChanged: (value) async {
                            final position = Duration(seconds: value.toInt());
                            await audioPlayer.seek(position);

                            await audioPlayer.resume();
                          },
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(formatTime(position)),
                                Text(formatTime(duration)),
                              ],
                            )),
                        CircleAvatar(
                          backgroundColor: Color(0xFF640000),
                            radius: 35,
                            child: IconButton(
                              
                              icon: Icon(
                                  isPlaying ? Icons.pause : Icons.play_arrow, color: Color(0xFFF8EFE9)),
                              iconSize: 50,
                              onPressed: () async {
                                if (isPlaying) {
                                  await audioPlayer.pause();
                                } else {
                                  await audioPlayer.resume();
                                }
                              },
                            ))
                      ],
                    ),
                  ],
                ),
              )),
        ),
      );
}
