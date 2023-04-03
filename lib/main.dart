import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(GameApplication());
}

class GameApplication extends StatefulWidget {
  const GameApplication({super.key});

  @override
  State<GameApplication> createState() => _GameApplicationState();
}

class _GameApplicationState extends State<GameApplication> {
  int top = 2;
  int bottom = 2;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'vazir'),
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/gamepage.png'), fit: BoxFit.cover)),
        child: BackdropFilter(
          filter: new ImageFilter.blur(sigmaX: 1.0, sigmaY: 2.0),
          child: Scaffold(
            appBar: AppBar(
              elevation: 4,
              centerTitle: true,
              title: Text(
                'سنگ   کاغذ   قیچی',
                style: TextStyle(fontSize: 26),
              ),
              flexibleSpace: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.lightBlue, Colors.pink],
                )),
              ),
            ),
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image(
                    image: AssetImage('images/$top.png'),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        top = Random().nextInt(3) + 1; //0-2 -> 1 3
                        bottom = Random().nextInt(3) + 1;
                      });
                    },
                    child: Text(
                      'شروع بازی',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                  Flexible(
                    child: Image(
                      image: AssetImage('images/$bottom.png'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
