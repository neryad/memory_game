class GameLogic {
  final String hiddenCard = 'assets/images/box.png';
  List<String>? cardsImg;
  final int cardCount = 12;

  void initGame() {
    cardsImg = List<String>.generate(cardCount, (index) {
      return hiddenCard;
    });
  }
}
