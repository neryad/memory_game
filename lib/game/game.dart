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
  String level = '';
  var complete = 0;
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

    startTimer(context);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _game.initGame(context);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async {
        bool willLeave = false;
        timer.cancel();
        // show the confirm dialog
        await showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: const Text('Seguro que quiere salir de la partida?'),
                  actions: [
                    ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(primary: utils.redColor),
                        onPressed: () {
                          willLeave = true;
                          Navigator.of(context).pop();
                        },
                        child: const Text('Yes')),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          startTimer(context);
                        },
                        child: const Text(
                          'No',
                          style: TextStyle(color: utils.blueColor),
                        ))
                  ],
                ));
        return willLeave;
      },
      child: Scaffold(
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
                  crossAxisCount: _game.axiCount,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        setState(() {
                          tries++;

                          _game.cardsImg![index] = _game.card_list[index];

                          _game.matchCheck.add({index: _game.card_list[index]});

                          if (_game.matchCheck.length == 2) {
                            if (_game.matchCheck[0].values.first ==
                                _game.matchCheck[1].values.first) {
                              score += 100;
                              complete += 1;

                              _game.matchCheck.clear();
                              if (complete * 2 == _game.cardCount) {
                                _showDialog(context, 'Ganaste',
                                    'Tu puntuación fue de: $score');
                                timer.cancel();
                              }
                            } else {
                              Future.delayed(const Duration(milliseconds: 500),
                                  () {
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
      ),
    );
  }

  void _showDialog(BuildContext context, String title, String info) {
    showDialog(
        context: context,
        barrierDismissible: false,
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
