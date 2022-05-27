import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:memory_game/game/game_logic.dart';
import 'package:memory_game/game/widgets/board.dart';
import 'package:memory_game/shared/utils.dart' as utils;
import 'package:memory_game/game/widgets/dialoag.dart';

class Game extends StatefulWidget {
  Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  final GameLogic _game = GameLogic();

  var levelForCardCount = 0;
  var tries = 0;
  var score = 0;
  var axisNumber = 4;
  late Timer timer;
  int startTime = 60;

  void startTimer(BuildContext context) {
    if (startTime == 0) {}
    const oneSecond = Duration(seconds: 1);
    timer = Timer.periodic(oneSecond, (timer) {
      if (startTime == 0) {
        timer.cancel();
        _showDialog(context, 'Game Over', 'Tu puntuación fue de: $score');
      } else {
        setState(() {
          startTime--;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    // _game.initGame();
    startTimer(context);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
    String level = arguments['level'] as String;
    //_game.initGame(levelForCardCount);
    if (level == 'medium') {
      levelForCardCount = 24;
    }
    if (level == 'easy' || level == 'medium') {
      _game.cardCount = 18;
      print(_game.cardCount);
      axisNumber = 4;
    } else {
      axisNumber = 6;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: utils.redColor,
      ),
      backgroundColor: utils.redColor,
      body: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            board('Time', '$startTime'),
            board('Score', '$score'),
            board('Moves', '$tries')
          ],
        ),
        SizedBox(
          height: screenWidth,
          width: screenWidth,
          child: GridView.builder(
              itemCount: _game.cardsImg!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //TODO: Change the number of cross axis
                crossAxisCount: axisNumber,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      setState(() {
                        tries++;

                        _game.cardsImg![index] = _game.demo_card_list[index];

                        _game.matchCheck
                            .add({index: _game.demo_card_list[index]});
                        if (_game.matchCheck.length == 2) {
                          if (_game.matchCheck[0].values.first ==
                              _game.matchCheck[1].values.first) {
                            score += 100;

                            _game.matchCheck.clear();
                          } else {
                            Future.delayed(const Duration(milliseconds: 500),
                                () {
                              // print(_game.cardsImg);
                              setState(() {
                                _game.cardsImg![_game.matchCheck[0].keys
                                    .first] = _game.hiddenCard;
                                _game.cardsImg![_game.matchCheck[1].keys
                                    .first] = _game.hiddenCard;

                                _game.matchCheck.clear();
                              });
                            });
                          }
                        }
                      });

                      // _game.matchCheck
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: utils.whiteColor,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage(_game.cardsImg![index]),
                              fit: BoxFit.cover)),
                    ));
              }),
        ),
      ]),
    );
  }

  void _showDialog(BuildContext context, String title, String info) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(info),
            actions: <Widget>[
              TextButton(
                child: const Text('Ir a inicio'),
                onPressed: () {
                  // Navigator.of(context).pop();
                  Navigator.pushNamed(context, 'home');
                },
              )
            ],
          );
        });
  }
}
