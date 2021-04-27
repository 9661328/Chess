import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.sound.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Chess extends PApplet {

// Jonathan Su, 4/26/2021


SoundFile click;
PImage chessIcon, backArrow;

Button[] buttons = new Button[5];
Checkerboard board = new Checkerboard(0xffF02727);
int screen = -1;
boolean run = false;

public void setup() {
  
  chessIcon = loadImage("chessIcon.png");
  backArrow = loadImage("backArrow.png");
  buttons[0] = new Button("", 20, 20, 30, 30, 0xffF0A2A2, 2, 0xffF0A2A2);
  buttons[1] = new Button("Start (S)", width/2, 270, 400, 60, 150, 2, 0xffCDEB8B);
  buttons[2] = new Button("Quit (Q)", width/2, 330, 400, 60, 150, 2, 0xffFFCC99);
  buttons[3] = new Button("Settings (E)", width/2, 390, 400, 60, 150, 2, 0xffFFCCCC);
  buttons[4] = new Button("Credits (C)", width/2, 450, 400, 60, 150, 2, 0xffCCE5FF);

  click = new SoundFile(this, "Windows XP Error.mp3");
}

public void draw() {
  switch(screen) {
  case -1:
  case 0:
    startScreen();
    break;
  case 1:
    playScreen();
    break;
  case 3: 
    settingScreen();
    break;
  case 4:
    creditScreen();
    break;
  }
}

public void mouseClicked() {
  if (buttons[0].hover) {
    screen = 0;
  } else if (buttons[1].hover) {
    click.play();
    screen = 1;
  } else if (buttons[2].hover) {
    exit();
  } else if (buttons[3].hover) {
    click.play();
    screen = 3;
  } else if (buttons[4].hover) {
    click.play();
    screen = 4;
  }
}


public void keyPressed() {
  if (key == 'S' || key == 's') {
    click.play();
    screen = 1;
  } else if (key == 'Q' || (key == 'q')) {
    click.play();
    exit();
  } else if (key == 'E' || (key == 'e')) {
    click.play();
    screen = 3;
  } else if (key == 'C' || (key == 'c')) {
    click.play();
    screen = 4;
  } else if (key == 'B' || key == 'b') {
    screen = 0;
  }
}

public void startScreen() {
  background(0xffFFFF66);
  for (int i = 0; i < buttons.length; i++) {
    buttons[i].display();
    buttons[i].hover();
  }
  imageMode(CENTER);
  image(chessIcon, width/2, 110, 172, 172);
  image(backArrow, 20, 20, 30, 30);
}

public void playScreen() {
  background(255);
}

public void endScreen() {
  background(255);
}

public void settingScreen() {
  background(255);
  buttons[0].display();
  buttons[0].hover();
  image(backArrow, 20, 20, 30, 30);
}

public void creditScreen() {
  background(0);

  buttons[0].display();
  buttons[0].hover();
  image(backArrow, 20, 20, 30, 30);

  text("Created by Jonathan Su", width/2, 200);
  text("Written in Processing for Computer Programming 1", width/2, 230);
}

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

  public void display() {
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

  public void hover() {
    hover = mouseX > x - w/2 && mouseX < x + w/2 && mouseY > y - h/2 && mouseY < y + h/2;
  }
}
class Checkerboard {
  int a;
  float squareSize = 62.5f;

  Checkerboard(int a) {
    this.a = a;
  }

  public void display() {
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





  public void settings() {  size(500, 500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Chess" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
