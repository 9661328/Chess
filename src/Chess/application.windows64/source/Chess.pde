// Jonathan Su, 4/26/2021

import processing.sound.*;
SoundFile click;
PImage chessIcon, backArrow;

Button[] buttons = new Button[5];
Checkerboard board = new Checkerboard(#F02727);
int screen = -1;
boolean run = false;

void setup() {
  size(500, 500);
  chessIcon = loadImage("chessIcon.png");
  backArrow = loadImage("backArrow.png");
  buttons[0] = new Button("", 20, 20, 30, 30, #F0A2A2, 2, #F0A2A2);
  buttons[1] = new Button("Start (S)", width/2, 270, 400, 60, 150, 2, #CDEB8B);
  buttons[2] = new Button("Quit (Q)", width/2, 330, 400, 60, 150, 2, #FFCC99);
  buttons[3] = new Button("Settings (E)", width/2, 390, 400, 60, 150, 2, #FFCCCC);
  buttons[4] = new Button("Credits (C)", width/2, 450, 400, 60, 150, 2, #CCE5FF);

  click = new SoundFile(this, "Windows XP Error.mp3");
}

void draw() {
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
}

void endScreen() {
  background(255);
}

void settingScreen() {
  background(255);
  buttons[0].display();
  buttons[0].hover();
  image(backArrow, 20, 20, 30, 30);
}

void creditScreen() {
  background(0);

  buttons[0].display();
  buttons[0].hover();
  image(backArrow, 20, 20, 30, 30);

  text("Created by Jonathan Su", width/2, 200);
  text("Written in Processing for Computer Programming 1", width/2, 230);
}
