class Cell {
  PImage pieceImage;
  String pieceValue;
  int x, y, squareSize;

  Cell(String pieceValue, int x, int y) {
    this.pieceValue = pieceValue;
    this.x = x;
    this.y = y;
    squareSize = 50;
  }

  void setPieceVal(String pieceValue) {
    this.pieceValue = pieceValue;
    pieceImage = loadImage(pieceValue + ".png");
  }

  void placePiece() {
    imageMode(CORNER);
    if (pieceImage != null) {
      image(pieceImage, x, y, squareSize, squareSize);
    }
  }
}
