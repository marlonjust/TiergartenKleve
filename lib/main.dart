import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tiergarten Kleve',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromRGBO(244, 123 , 32, 100)),
        useMaterial3: false,
      ),
      home: const MyHomePage(title: 'Audioführer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
             SizedBox(height: 10),
            const Text(
              'Ich begleite dich heute durch den Tiergarten',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            Text(
              'Wähle eine Tour aus:',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            ElevatedButton(
              onPressed: () {
                print('Pressed');
              },
              child: Text('Abenteuertour', style: TextStyle(fontSize: 24),
              ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
              onPressed: () {
                print('Pressed');
              },
              child: Text('Standardtour', style: TextStyle(fontSize: 24),
              ),
              ),
          ],
        ),
      ),
    );
  }
}
