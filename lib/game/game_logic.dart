import 'dart:async';

import 'dart:collection';

import 'package:flutter/material.dart';

class GameLogic {
  final String hiddenCard = 'assets/images/box.png';
  List<String>? cardsImg;
  String level = '';

  late List<String> card_list = [];

  var axiCount = 0;
  var cardCount = 0;
  List<Map<int, String>> matchCheck = [];

  void initGame(BuildContext context) {
    Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
    String difficult = arguments['level'] as String;
    if (difficult == 'medium') {
      cardCount = 24;
      axiCount = 6;
      card_list = [
        'assets/images/angry-birds.png',
        'assets/images/bomberman.png',
        'assets/images/angry-birds.png',
        'assets/images/carnivorous-plant.png',
        'assets/images/game-console.png',
        'assets/images/angry-birds.png',
        'assets/images/angry-birds.png',
        'assets/images/gamepad.png',
        'assets/images/carnivorous-plant.png',
        'assets/images/game-console.png',
        'assets/images/game-pad.png',
        'assets/images/game-pad.png',
        'assets/images/carnivorous-plant.png',
        'assets/images/carnivorous-plant.png',
        'assets/images/gamepad.png',
        'assets/images/minecraft.png',
        'assets/images/minecraft.png',
        'assets/images/pick.png',
        'assets/images/pick.png',
        'assets/images/bomberman.png',
        'assets/images/pick.png',
        'assets/images/pick.png',
        'assets/images/game-console.png',
        'assets/images/game-console.png',
      ];
    } else if (difficult == 'hard') {
      cardCount = 30;
      axiCount = 6;
      card_list = [
        'assets/images/angry-birds.png',
        'assets/images/bomberman.png',
        'assets/images/angry-birds.png',
        'assets/images/carnivorous-plant.png',
        'assets/images/game-console.png',
        'assets/images/gamepad.png',
        'assets/images/carnivorous-plant.png',
        'assets/images/game-console.png',
        'assets/images/angry-birds.png',
        'assets/images/angry-birds.png',
        'assets/images/game-pad.png',
        'assets/images/game-pad.png',
        'assets/images/carnivorous-plant.png',
        'assets/images/carnivorous-plant.png',
        'assets/images/gamepad.png',
        'assets/images/minecraft.png',
        'assets/images/minecraft.png',
        'assets/images/pick.png',
        'assets/images/pick.png',
        'assets/images/bomberman.png',
        'assets/images/pick.png',
        'assets/images/pick.png',
        'assets/images/game-console.png',
        'assets/images/game-console.png',
        'assets/images/game-console.png',
        'assets/images/game-console.png',
        'assets/images/bomberman.png',
        'assets/images/bomberman.png',
        'assets/images/minecraft.png',
        'assets/images/minecraft.png',
      ];
    } else {
      cardCount = 16;
      axiCount = 4;
      card_list = [
        'assets/images/angry-birds.png',
        'assets/images/bomberman.png',
        'assets/images/angry-birds.png',
        'assets/images/carnivorous-plant.png',
        'assets/images/game-console.png',
        'assets/images/gamepad.png',
        'assets/images/carnivorous-plant.png',
        'assets/images/game-console.png',
        'assets/images/game-pad.png',
        'assets/images/game-pad.png',
        'assets/images/gamepad.png',
        'assets/images/minecraft.png',
        'assets/images/minecraft.png',
        'assets/images/pick.png',
        'assets/images/pick.png',
        'assets/images/bomberman.png',
      ];
    }
    card_list.shuffle();
    cardsImg = List<String>.generate(cardCount, (index) {
      return hiddenCard;
    });
  }
}
