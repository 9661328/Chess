// Jonathan Su, 4/26/2021

import processing.sound.*;
SoundFile click;
Button[] buttons = new Button[5];

PImage chessIcon, backArrow;
PFont settings;
int screen = 0;
boolean run = false;

void setup() {
  size(500, 500);

  chessIcon = loadImage("chessIcon.png");
  backArrow = loadImage("backArrow.png");

  settings = loadFont("BritannicBold-30.vlw");

  // Button(String word, int xpos, int ypos, int widt, int heigh, int roundCorner, int stroke, int strokeWeight, int fillNotHover, int fillHover, int textFill)
  buttons[0] = new Button("", 20, 20, 30, 30, 10, #F0A2A2, 2, #F0A2A2, 255, 0);
  buttons[1] = new Button("Start (S)", width/2, 270, 400, 60, 10, 150, 2, #CDEB8B, 200, 0);
  buttons[2] = new Button("Quit (Q)", width/2, 330, 400, 60, 10, 150, 2, #FFCC99, 200, 0);
  buttons[3] = new Button("Settings (E)", width/2, 390, 400, 60, 10, 150, 2, #FFCCCC, 200, 0);
  buttons[4] = new Button("Credits (C)", width/2, 450, 400, 60, 10, 150, 2, #CCE5FF, 200, 0);

  click = new SoundFile(this, "Windows XP Error.mp3");
}

void draw() {
  switch(screen) {
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

void mouseClicked() {
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

void keyPressed() {
  if (key == 'B' || key == 'b') {
    screen = 0;
  } else if (key == 'S' || key == 's') {
    click.play();
    screen = 1;
  } else if (key == 'Q' || key == 'q') {
    click.play();
    exit();
  } else if (key == 'E' || key == 'e') {
    click.play();
    screen = 3;
  } else if (key == 'C' || key == 'c') {
    click.play();
    screen = 4;
  }
}

void startScreen() {
  background(#FFFF66);
  for (int i = 0; i < buttons.length; i++) {
    buttons[i].display();
    buttons[i].hover();
  }
  imageMode(CENTER);
  image(chessIcon, width/2, 110, 172, 172);
  image(backArrow, 20, 20, 30, 30);
}

void playScreen() {
  background(255);
  buttons[0].display();
  buttons[0].hover();
  image(backArrow, 20, 20, 30, 30);
}

//void endScreen() {
//  background(255);
//}

void settingScreen() {
  background(255);
  buttons[0].display();
  buttons[0].hover();
  image(backArrow, 20, 20, 30, 30);

  textFont(settings);
  textAlign(CENTER, CENTER);
  text("Settings", width/2, 25);
}

void creditScreen() {
  background(255);
  buttons[0].display();
  buttons[0].hover();
  image(backArrow, 20, 20, 30, 30);

  text("Created by Jonathan Su", width/2, 200);
  text("Written in Processing for Computer Programming 1", width/2, 230);
}
