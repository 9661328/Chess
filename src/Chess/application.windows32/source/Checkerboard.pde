class Checkerboard {
  color a;
  float squareSize = 62.5;

  Checkerboard(color a) {
    this.a = a;
  }

  void display() {
    background(a);
    noStroke();
    for (int i = 0; i < width; i++) {
      if (i%2 == 0) {
        rect(i * squareSize, squareSize * 0, squareSize, squareSize);
        rect(i * squareSize, squareSize * 2, squareSize, squareSize);
        rect(i * squareSize, squareSize * 4, squareSize, squareSize);
        rect(i * squareSize, squareSize * 6, squareSize, squareSize);
      } else {
        rect(i * squareSize, squareSize * 1, squareSize, squareSize);
        rect(i * squareSize, squareSize * 3, squareSize, squareSize);
        rect(i * squareSize, squareSize * 5, squareSize, squareSize);
        rect(i * squareSize, squareSize * 7, squareSize, squareSize);
      }
    }
  }
}
