import 'package:flutter/material.dart';

import 'game/game.dart';
import 'home/home_page.dart';
import 'info/info_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memory Game',
      home: HomePage(),
      routes: {
        'home': (context) => HomePage(),
        'game': (context) => Game(),
        'info': (context) => InfoPage(),
      },
    );
  }
}
