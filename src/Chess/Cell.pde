class Cell {
  PImage pieceImage;
  String pieceValue;
  color oddSquareColor;
  int x, y, rows, columns, margin, squareSize;

  Cell(String pieceValue, int x, int y, color oddSquareColor) {
    pieceImage = null;
    this.pieceValue = pieceValue;
    this.oddSquareColor = oddSquareColor;
    this.x = x;
    this.y = y;
    rows = 8;
    columns = 8;
    margin = 60;
    squareSize = (500 - margin)/8;
  }

  void setPieceVal(String pieceValue) {
    this.pieceValue = pieceValue;
  }

  void display() {
    for (int a = rows; a > 0; a--) {
      y = (width - 5) - (squareSize * a);
      for (int b = columns; b > 0; b--) {
        x = (height - 5) - (squareSize * b);

        // even square white, odd square selected color
        if ((a+b)%2 == 0) {
          fill(255);
        } else {
          fill(oddSquareColor);
        }
        rectMode(CORNER);
        stroke(oddSquareColor);
        strokeWeight(2);
        rect(x, y, squareSize, squareSize);

        fill(0);
        text(a, 40, y + (squareSize/2));
        text(char(b + 64), x + (squareSize/2), 40);
      }
      if (pieceImage != null) {
        pieceImage = loadImage(pieceValue + ".png");
        image(pieceImage, x, y, squareSize, squareSize);
      }
    }
  }
}
