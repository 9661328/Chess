class Cell {
  PImage pieceImage;
  String pieceValue;
  boolean hover;
  color hoverColor, highlightColor, highlightStroke;
  int xpos, ypos, squareSize;

  Cell(String pieceValue, int xpos, int ypos) {
    this.pieceValue = pieceValue;
    hover = false;
    hoverColor = color(0, 255, 0, 100);
    highlightColor = color(255, 100);
    highlightStroke = 255;
    this.xpos = xpos;
    this.ypos = ypos;
    squareSize = checkerboard.squareSize;
  }

  void setPieceVal(String pieceValue) {
    this.pieceValue = pieceValue;
    pieceImage = loadImage(pieceValue + ".png");
  }

  void placePiece() {
    imageMode(CORNER);
    if (pieceImage != null) {
      image(pieceImage, xpos, ypos, squareSize, squareSize);
    }
  }

  void hover() {
    if (mouseX < xpos + squareSize && mouseX > xpos && mouseY < ypos + squareSize && mouseY > ypos) {
      fill(hoverColor);
      rect(xpos, ypos, squareSize, squareSize);
    }
  }

  void highlightCell() {
    if (hover) {
      fill(highlightColor);
      stroke(highlightStroke);
      strokeWeight(2);
      rect(xpos, ypos, squareSize, squareSize);
    }
  }
}
