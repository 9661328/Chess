// Jonathan Su, 4/26/2021

import processing.sound.*;

PImage chessIcon, backArrow, githubLogo, processingLogo, settingGears, playBackground, soundIcon;
PFont creditFinePrint;
int screen, elapsedTime, minutes, seconds;
boolean run;
SoundFile click, back, horse, githubClick, backgroundMusic1, backgroundMusic2, backgroundMusic3;

Button[] buttons = new Button[5];
Button[] otherButtons = new Button[2];
Cell[][] cell = new Cell[8][8];
Checkerboard checkerboard = new Checkerboard(200);



void setup() {
  size(500, 500);

  chessIcon = loadImage("chessIcon.png");
  backArrow = loadImage("backArrow.png");
  githubLogo = loadImage("githubLogo.png");
  processingLogo = loadImage("processingLogo.png");
  settingGears = loadImage("settingGears.png");
  playBackground = loadImage("playBackground.jpg");
  soundIcon = loadImage("soundIcon.png");

  creditFinePrint = loadFont("Calibri-12.vlw");

  screen = 0;

  run = false;

  // Button(String word, int xpos, int ypos, int widt, int heigh, int roundCorner, int stroke, int strokeWeight, int fillNotHover, int fillHover, int textFill)

  buttons[0] = new Button("", 20, 20, 30, 30, 10, #F0A2A2, 2, #F0A2A2, 255, 0); // back button
  buttons[1] = new Button("Start (S)", width/2, 270, 400, 60, 10, 150, 2, #CDEB8B, 200, 0);
  buttons[2] = new Button("Quit (Q)", width/2, 330, 400, 60, 10, 150, 2, #FFCC99, 200, 0);
  buttons[3] = new Button("Settings (E)", width/2, 390, 400, 60, 10, 150, 2, #FFCCCC, 200, 0);
  buttons[4] = new Button("Credits (C)", width/2, 450, 400, 60, 10, 150, 2, #CCE5FF, 200, 0);
  otherButtons[0] = new Button("GitHub Repository:\nhttps://github.com/9661328/chess", width/2, 345, 400, 60, 10, 150, 2, #D5E8D4, 200, #3399FF);
  otherButtons[1] = new Button("", 60, 20, 30, 30, 10, 100, 2, #F0A2A2, 255, 0); // sound button




  click = new SoundFile(this, "click.wav");
  back = new SoundFile(this, "back.wav");
  horse = new SoundFile(this, "horse.wav");
  githubClick = new SoundFile(this, "githubClick.wav");
  backgroundMusic1 = new SoundFile(this, "Silent Partner.wav");
  backgroundMusic2 = new SoundFile(this, "Solve The Puzzle.wav");
  backgroundMusic3 = new SoundFile(this, "Adventures – A Himitsu.wav");
}



void draw() {
  println(mouseX + " " + mouseY);
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
    if (screen != 0) {
      back.play();
    }
    screen = 0;
    if (backgroundMusic1.isPlaying()) {
      backgroundMusic1.stop();
    }
    if (run) {
      run = false;
    }
  } else if (buttons[1].hover) {
    screen = 1;
    click.play();
    run = true;
    if (otherButtons[1].fillNotHover != #FF0808) {
      backgroundMusic2.play();
      backgroundMusic2.loop();
    }
    buttons[1].hover = false;
  } else if (buttons[2].hover) {
    exit();
  } else if (buttons[3].hover) {
    screen = 3;
    click.play();
    buttons[3].hover = false;
  } else if (buttons[4].hover) {
    screen = 4;
    click.play();
    buttons[4].hover = false;
  }
  if (otherButtons[0].hover) {
    githubClick.play();
    link("https://github.com/9661328/chess");
  } else if (otherButtons[1].hover) {
    if (backgroundMusic1.isPlaying()) {
      backgroundMusic1.stop();
      otherButtons[1].fillNotHover = #FF0808;
    } else if (!backgroundMusic1.isPlaying()) {
      backgroundMusic1.play();
      backgroundMusic1.loop();
      otherButtons[1].fillNotHover = #F0A2A2;
    }
  }
  if (screen == 0 && mouseX < width/2 + 86 && mouseX > width/2 - 86 && mouseY < 110 + 86 && mouseY > 110 - 86) {
    horse.play();
  }
}

//void keyPressed() {
//  if (key == 'B' || key == 'b') {
//    screen = 0;
//  } else if (key == 'S' || key == 's') {
//    click.play();
//    screen = 1;
//  } else if (key == 'Q' || key == 'q') {
//    click.play();
//    exit();
//  } else if (key == 'E' || key == 'e') {
//    click.play();
//    screen = 3;
//  } else if (key == 'C' || key == 'c') {
//    click.play();
//    screen = 4;
//  }
//}

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
  imageMode(CENTER);
  image(playBackground, width/2, height/2, 1110, 510);
  buttons[0].display();
  buttons[0].hover();
  otherButtons[1].display();
  otherButtons[1].hover();
  image(backArrow, 20, 20, 30, 30);
  image(soundIcon, 60, 20, 25, 25);

  elapsedTime = millis();
  seconds = (elapsedTime / 1000) % 60;
  minutes = (elapsedTime / 1000) / 60;
  if (seconds < 10) {
    text(minutes + ":0" + seconds, width/2, 20);
  } else {
    text(minutes + ":" + seconds, width/2, 20);
  }

  for (int row = 0; row < 8; row++) {
    for (int column = 0; column < 8; column++) {
      cell[row][column] = new Cell("", (checkerboard.pixelFromLeft + (column * checkerboard.squareSize)), (checkerboard.pixelFromTop + (row * checkerboard.squareSize)));
    }
  }

  cell[0][0].setPieceVal("blackRook");
  cell[0][1].setPieceVal("blackKnight");
  cell[0][2].setPieceVal("blackBishop");
  cell[0][3].setPieceVal("blackKing");
  cell[0][4].setPieceVal("blackQueen");
  cell[0][5].setPieceVal("blackBishop");
  cell[0][6].setPieceVal("blackKnight");
  cell[0][7].setPieceVal("blackRook");
  for (int i = 0; i < 8; i++) {
    cell[1][i].setPieceVal("blackPawn");
  }
  cell[7][0].setPieceVal("whiteRook");
  cell[7][1].setPieceVal("whiteKnight");
  cell[7][2].setPieceVal("whiteBishop");
  cell[7][3].setPieceVal("whiteKing");
  cell[7][4].setPieceVal("whiteQueen");
  cell[7][5].setPieceVal("whiteBishop");
  cell[7][6].setPieceVal("whiteKnight");
  cell[7][7].setPieceVal("whiteRook");
  for (int i = 0; i < 8; i++) {
    cell[6][i].setPieceVal("whitePawn");
  }

  checkerboard.display();
  for (int row = 0; row < 8; row++) {
    for (int column = 0; column < 8; column++) {
      cell[row][column].placePiece();
      cell[row][column].hover();
    }
  }
}

//void endScreen() {
//  background(255);
//}

void settingScreen() {
  background(255);
  buttons[0].display();
  buttons[0].hover();

  imageMode(CENTER);
  image(backArrow, 20, 20, 30, 30);
  //image(settingGears, 340, 30, 50, 50);

  fill(0);
  //textFont();
  textAlign(CENTER, CENTER);
  text("Settings", width/2, 25);
}

void creditScreen() {
  background(255);
  buttons[0].display();
  buttons[0].hover();
  otherButtons[0].display();
  otherButtons[0].hover();

  imageMode(CENTER);
  image(backArrow, 20, 20, 30, 30);
  image(processingLogo, 80, 115, 85, 85);
  image(chessIcon, 420, 105, 103, 103);
  image(githubLogo, 420, 345, 50, 50);

  fill(0);
  textAlign(CENTER, CENTER);
  text("Credits", width/2, 25);
  text("Developer: Jonathan Su", width/2, 80);
  text("Written in: Processing", width/2, 120);
  text("Description: ", width/2, 160);

  fill(100);
  textFont(creditFinePrint);
  textAlign(CENTER, CENTER);
  text("All rights reserved. No part of this publication may be reproduced,", width/2, 405);
  text("distributed, or transmitted in any form or by any means, including", width/2, 420);
  text("photocopying, recording, or other electronic or mechanical methods,", width/2, 435);
  text("without the prior written permission of the publisher, except in the case of", width/2, 450);
  text("brief quotations embodied in critical reviews and certain other", width/2, 465);
  text("noncommercial uses permitted by copyright law.", width/2, 480);
}
