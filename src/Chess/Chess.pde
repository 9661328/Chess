// Jonathan Su, 4/26/2021

import processing.sound.*;
SoundFile click;
PImage chessIcon;

Button[] buttons = new Button[4];
Button[] otherButtons = new Button [1];
Checkerboard board = new Checkerboard(#F02727);
boolean run = false;

void setup() {
  size(500, 500);
  chessIcon = loadImage("chessIcon.png");
  buttons[0] = new Button("Start (S)", width/2, 270, 400, 60, 150, 2, #CDEB8B);
  buttons[1] = new Button("Quit (Q)", width/2, 330, 400, 60, 150, 2, #FFCC99);
  buttons[2] = new Button("Settings (E)", width/2, 390, 400, 60, 150, 2, #FFCCCC);
  buttons[3] = new Button("Credits (C)", width/2, 450, 400, 60, 150, 2, #CCE5FF);
  click = new SoundFile(this, "Roblox Death Sound.mp3");
}

void draw() {
  if (!run) {
    startScreen();
  }
}

void keyPressed() {
  if (key == 'S' || key == 's') {
    click.play();
    playScreen();
    run = true;
  } else if (key == 'Q' || (key == 'q')) {
    click.play();
    exit();
  } else if (key == 'E' || (key == 'e')) {
    click.play();
    settingScreen();
    run = true;
  } else if (key == 'C' || (key == 'c')) {
    click.play();
    creditScreen();
    run = true;
  } else if (key == 'B' || key == 'b') {
    startScreen();
    run = false;
  }
}

void mouseClicked() {
  if (buttons[0].hover) {
    click.play();
    playScreen();
    run = true;
  } else if (buttons[1].hover) {
    click.play();
    exit();
  } else if (buttons[2].hover) {
    click.play();
    settingScreen();
    run = true;
  } else if (buttons[3].hover) {
    click.play();
    creditScreen();
    run = true;
  }
}

void startScreen() {
  background(#FFFF66);
  imageMode(CENTER);
  image(chessIcon, width/2, 110, 172, 172);
  for (int i = 0; i < buttons.length; i++) {
    buttons[i].display();
    buttons[i].hover();
  }
}

void playScreen() {
  background(255);
}

void endScreen() {
}

void settingScreen() {
  background(255);
}

void creditScreen() {
  background(255);
  text("Created by Jonathan Su", width/2, height/2);
}
