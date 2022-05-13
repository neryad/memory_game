import 'package:flutter/material.dart';
import 'package:memory_game/shared/utils.dart' as utils;

class GameLogic extends StatefulWidget {
  GameLogic({Key? key}) : super(key: key);

  @override
  State<GameLogic> createState() => _GameLogicState();
}

class _GameLogicState extends State<GameLogic> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: utils.redColor,
    );
  }
}
