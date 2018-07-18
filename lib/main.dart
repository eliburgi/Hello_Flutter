import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    title: "Hello-Flutter",
    home: HelloPage(),
  ));
}

class HelloPage extends StatefulWidget {
  @override
  _HelloPageState createState() => _HelloPageState();
}

class _HelloPageState extends State<HelloPage> {
  static const _greetings = [
    "Hello",
    "Bonjour",
    "Hola",
    "Hallo",
    "Ciao",
    "Olà",
    "Namaste",
  ];
  static Random rand = Random();

  String _greeting = '';

  @override
  void initState() {
    super.initState();
    _greeting = _greetings[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF54C5F8),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 90.0,
                height: 90.0,
                child: FloatingActionButton(
                  onPressed: _changeGreeting,
                  backgroundColor: Colors.white,
                  child: FlutterLogo(
                    size: 60.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
              ),
              RichText(
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                    text: _greeting + ',',
                    style: const TextStyle(
                      fontSize: 60.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                      text: "\nFlutter!",
                      style: const TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 24.0,
                        color: Colors.white,
                      )),
                ]),
              )
            ],
          ),
        ));
  }

  _changeGreeting() {
    String newGreeting;
    do {
      newGreeting = _greetings[rand.nextInt(_greetings.length)];
    } while (newGreeting == _greeting);

    setState(() {
      _greeting = newGreeting;
    });
  }
}
