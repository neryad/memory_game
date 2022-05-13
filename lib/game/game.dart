import 'package:flutter/material.dart';
import 'package:memory_game/game/game_logic.dart';
import 'package:memory_game/game/widgets/board.dart';
import 'package:memory_game/shared/utils.dart' as utils;

class Game extends StatefulWidget {
  Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  final GameLogic _game = GameLogic();
  @override
  void initState() {
    super.initState();
    _game.initGame();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
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
            board('Time', '00:30'),
            board('Score', '100'),
            board('Moves', '30')
          ],
        ),
        SizedBox(
          height: screenWidth,
          width: screenWidth,
          child: GridView.builder(
              itemCount: _game.cardsImg!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //TODO: Change the number of cross axis
                crossAxisCount: 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      print('hola');
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
}
