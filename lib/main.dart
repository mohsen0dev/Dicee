import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.red),
      title: 'DicE',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text('Dice...'),
        ),
        body: const Dice(),
      ),
    );
  }
}

class Dice extends StatefulWidget {
  const Dice({Key? key}) : super(key: key);

  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int left = 1;
  int right = 1;
  Random rnd = Random();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon(Icons.abc),
              Row(children: [
                Expanded(
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          left = rnd.nextInt(6) + 1;
                        });
                      },
                      child: Image.asset('images/dice$left.png')),
                ),
                Expanded(
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          right = rnd.nextInt(6) + 1;
                        });
                      },
                      child: Image.asset('images/dice$right.png')),
                ),
              ]),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  onPressed: () {
                    setState(() {
                      right = rnd.nextInt(6) + 1;
                      left = rnd.nextInt(6) + 1;
                    });
                  },
                  child: const Text(
                    'تاس جفت',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.red),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
