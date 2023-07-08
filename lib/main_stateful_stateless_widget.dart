import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  double rotationZ = 0.1;
  String text = "";
  Color color = Colors.red;
  double rotationX = 0.1;

  List<Color> lsColors = [
    Colors.black,
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.pink,
    Colors.orange,
    Colors.purple,
    Colors.lightBlue,
  ];
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        rotationX += 0.1;
        rotationZ += 0.2;
        if (rotationZ < 1) {
          text = "I Love You!";
        }
        if (rotationZ > 1) {
          text = "Forever!!";
        }
        if (rotationZ > 2) {
          text = "I love you!!";
          rotationZ = 0.1;
        }
        print(rotationZ);

        //generate random color inside lsColors
        color = lsColors[Random().nextInt(lsColors.length)];
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test stateful and stateLess!"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              transform: Matrix4.rotationZ(rotationZ),
              alignment: Alignment.center,
              width: 150,
              height: 150,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              child: Text(
                "${text}",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 24),
              ),
            ),
            Container(
              transform: Matrix4.rotationX(rotationZ),
              alignment: Alignment.center,
              width: 150,
              height: 150,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              child: Text(
                "${text}",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
