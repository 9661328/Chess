class Checkerboard {
  color oddSquareColor, highlightColor, highlightStroke;
  int ROWS, COLUMNS, pixelFromTop, pixelFromLeft, squareSize, xpos, ypos;

  Checkerboard(color oddSquareColor) {
    this.oddSquareColor = oddSquareColor;
    highlightColor = color(255, 100);
    highlightStroke = color(0, 255, 255);
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
      for (int b = 0; b < COLUMNS; b++) {
        ypos = pixelFromTop + (squareSize * a);
        xpos = pixelFromLeft + (squareSize * b);
        if ((a+b) % 2 == 0) {
          fill(255, 220);
        } else {
          fill(oddSquareColor, 220);
        }
        rectMode(CORNER);
        stroke(oddSquareColor);
        strokeWeight(2);
        rect(xpos, ypos, squareSize, squareSize);

// fixing
        if (playerTurn == 1) {
          fill(255);
        } else if (playerTurn == 2) {
          fill(0);
        }
        rect(460, 10, 30, 30);

        fill(0);
        text(a + 1, pixelFromLeft - 10, ypos + (squareSize/2));
        text(char(b + 65), xpos + (squareSize/2), pixelFromTop - 10);
      }
    }
  }
}
