class Button {
  PFont buttonFont;
  boolean hover;
  String word;
  int xpos, ypos, widt, heigh, roundCorner, stroke, strokeWeight, fillNotHover, fillHover, textFill;

  Button(String word, int xpos, int ypos, int widt, int heigh, int roundCorner, int stroke, int strokeWeight, int fillNotHover, int fillHover, int textFill) {
    buttonFont = null;
    hover = false;
    this.word = word;
    this.xpos = xpos;
    this.ypos = ypos;
    this.widt = widt;
    this.heigh = heigh;
    this.roundCorner = roundCorner;
    this.stroke = stroke;
    this.strokeWeight = strokeWeight;
    this.fillNotHover = fillNotHover;
    this.fillHover = fillHover;
    this.textFill = textFill;
  }

  void display() {
    rectMode(CENTER);
    textAlign(CENTER, CENTER);
    stroke(stroke);
    if (hover) {
      fill(fillHover);
      strokeWeight(strokeWeight + 1);
    } else {
      fill(fillNotHover);
      strokeWeight(strokeWeight);
    }
    rect(xpos, ypos, widt, heigh, roundCorner);
    buttonFont = loadFont("Rockwell-Bold-15.vlw");
    textFont(buttonFont);
    fill(textFill);
    text(word, xpos, ypos);
  }

  void hover() {
    hover = mouseX > xpos - widt/2 && mouseX < xpos + widt/2 && mouseY > ypos - heigh/2 && mouseY < ypos + heigh/2;
  }
}
