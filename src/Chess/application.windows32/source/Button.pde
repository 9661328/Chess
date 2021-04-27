class Button {
  PFont startButtons;
  String word;
  int x, y, w, h, stroke, strokeWeight, fill;
  boolean hover, mouseClicked;

  Button(String word, int x, int y, int w, int h, int stroke, int strokeWeight, int fill) {
    startButtons = loadFont("Rockwell-Bold-15.vlw");
    this.word = word;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.stroke = stroke;
    this.strokeWeight = strokeWeight;
    this.fill = fill;
  }

  void display() {
    rectMode(CENTER);
    textAlign(CENTER, CENTER);
    stroke(stroke);
    strokeWeight(strokeWeight);
    if (!hover) {
      fill(fill);
    } else {
      fill(200);
    }

    rect(x, y, w, h, 10);

    fill(0);
    textFont(startButtons);
    text(word, x, y);
  }

  void hover() {
    hover = mouseX > x - w/2 && mouseX < x + w/2 && mouseY > y - h/2 && mouseY < y + h/2;
  }
}
