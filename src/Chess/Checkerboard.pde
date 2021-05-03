class Checkerboard {
  color oddSquareColor;
  int ROWS, COLUMNS, pixelFromTop, pixelFromLeft, squareSize, xpos, ypos;

  Checkerboard(color oddSquareColor) {
    this.oddSquareColor = oddSquareColor;
    ROWS = 8;
    COLUMNS = 8;
    pixelFromTop = 70;
    pixelFromLeft = 50;
    squareSize = 50;
    xpos = 0;
    ypos = 0;
  }

  void display() {
    for (int a = 0; a < ROWS; a++) {
      ypos = pixelFromTop + (squareSize * a);
      for (int b = 0; b < COLUMNS; b++) {
        xpos = pixelFromLeft + (squareSize * b);
        if ((a+b) % 2 == 0) {
          fill(255);
        } else {
          fill(oddSquareColor);
        }
        rectMode(CORNER);
        stroke(oddSquareColor);
        strokeWeight(2);
        rect(xpos, ypos, squareSize, squareSize);
        fill(0);
        text(a + 1, pixelFromLeft - 10, ypos + (squareSize/2));
        text(char(b + 65), xpos + (squareSize/2), pixelFromTop - 10);
      }
    }
  }
}
