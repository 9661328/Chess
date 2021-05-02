class Checkerboard {
  color oddSquareColor;
  int x, y, rows, columns, yMargin, xMargin, squareSize;

  Checkerboard(int squareSize, color oddSquareColor) {
    this.squareSize = squareSize;
    this.oddSquareColor = oddSquareColor;
    rows = 8;
    columns = 8;
    yMargin = 70;
    xMargin = 50;
  }

  void display() {
    for (int a = 0; a < rows; a++) {
      y = yMargin + squareSize * a;
      for (int b = 0; b < columns; b++) {
        x = xMargin + squareSize * b;

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
        text(a + 1, xMargin - 10, y + (squareSize/2));
        text(char(b + 65), x + (squareSize/2), yMargin - 10);
      }
    }
  }
}
