class Button {
  PFont font;
  boolean hover;
  String word;
  int x, y, w, h, stroke, strokeWeight, fill, fill2;

  Button(String word, int x, int y, int w, int h, int stroke, int strokeWeight, int fill, int fill2) {
    font = loadFont("Rockwell-Bold-15.vlw");
    hover = false;
    this.word = word;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.stroke = stroke;
    this.strokeWeight = strokeWeight;
    this.fill = fill;
    this.fill2 = fill2;
  }

  void display() {
    rectMode(CENTER);
    textAlign(CENTER, CENTER);
    stroke(stroke);
    strokeWeight(strokeWeight);
    if (!hover) {
      fill(fill);
    } else {
      fill(fill2);
    }
    rect(x, y, w, h, 10);
    fill(0);
    textFont(font);
    text(word, x, y);
  }

  void hover() {
    hover = mouseX > x - w/2 && mouseX < x + w/2 && mouseY > y - h/2 && mouseY < y + h/2;
  }
}
