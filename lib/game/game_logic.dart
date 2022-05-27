import 'dart:async';

class GameLogic {
  final String hiddenCard = 'assets/images/box.png';
  List<String>? cardsImg;
  String level = '';

  final List<String> demo_card_list = [
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
  final List<String> card_list = [
    'assets/images/angry-birds.png',
    'assets/images/bomberman.png',
    'assets/images/carnivorous-plant.png',
    'assets/images/game-console.png',
    'assets/images/game-pad.png',
    'assets/images/gamepad.png',
    'assets/images/minecraft.png',
    'assets/images/pick.png',
    'assets/images/pikachu.png',
    'assets/images/pixel.png',
    'assets/images/pokeball.png',
    'assets/images/snake.png',
    'assets/images/super-mario.png',
    'assets/images/tetris.png',
    'assets/images/world-of-warcraft.png',
  ];
  var cardCount = 16;
//4x4,4x6,5x6
  List<Map<int, String>> matchCheck = [];
  // void initGame() {
  //   cardsImg = List<String>.from(card_list);
  //   cardsImg.shuffle();
  // }
  void initGame() {
    demo_card_list.shuffle();
    cardsImg = List<String>.generate(cardCount, (index) {
      return hiddenCard;
    });
  }
}
