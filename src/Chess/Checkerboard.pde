class Checkerboard {
  color oddSquare;
  String squareLabel;
  int xpos, ypos, squareSize, rows, columns, margin;

  Checkerboard(color oddSquare) {
    this.oddSquare = oddSquare;
    xpos = 0;
    ypos = 0;
    rows = 8;
    columns = 8;
    margin = 40;
    squareSize = (500 - margin)/8;
  }

  void display() {

    for (int a = rows; a > 0; a--) {
      ypos = (height - 5) - (squareSize * a);
      for (int b = columns; b > 0; b--) {
        xpos = (width - 5) - (squareSize * b);

        // even square white, odd square selected color
        if ((a+b)%2 == 0) {
          fill(255);
        } else {
          fill(oddSquare);
        }
        rectMode(CORNER);
        stroke(oddSquare);
        rect(xpos, ypos, squareSize, squareSize);
        fill(0);
        text(a, 30, ypos + (squareSize/2));
        text(b, xpos + (squareSize/2), 30);
      }
    }
  }
}
