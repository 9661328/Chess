// Jonathan Su, 4/26/2021

import processing.sound.*;

PImage chessIcon, backArrow, githubLogo;
PFont finePrint;
int screen;
boolean run;

Button[] buttons = new Button[5];
Button[] otherButtons = new Button[1];
Checkerboard checkerboard = new Checkerboard(0);
SoundFile click;

void setup() {
  size(500, 500);

  chessIcon = loadImage("chessIcon.png");
  backArrow = loadImage("backArrow.png");
  githubLogo = loadImage("githubLogo.png");

  finePrint = loadFont("Calibri-12.vlw");
  
  screen = 0;
  
  run = false;

  // Button(String word, int xpos, int ypos, int widt, int heigh, int roundCorner, int stroke, int strokeWeight, int fillNotHover, int fillHover, int textFill)
  buttons[0] = new Button("", 20, 20, 30, 30, 10, #F0A2A2, 2, #F0A2A2, 255, 0);
  buttons[1] = new Button("Start (S)", width/2, 270, 400, 60, 10, 150, 2, #CDEB8B, 200, 0);
  buttons[2] = new Button("Quit (Q)", width/2, 330, 400, 60, 10, 150, 2, #FFCC99, 200, 0);
  buttons[3] = new Button("Settings (E)", width/2, 390, 400, 60, 10, 150, 2, #FFCCCC, 200, 0);
  buttons[4] = new Button("Credits (C)", width/2, 450, 400, 60, 10, 150, 2, #CCE5FF, 200, 0);
  otherButtons[0] = new Button("GitHub Repository:\nhttps://github.com/9661328/chess", width/2, 345, 400, 60, 10, 150, 2, #D5E8D4, 200, #3399FF);

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
  if (otherButtons[0].hover) {
    click.play();
    link("https://github.com/9661328/chess");
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
  
  checkerboard.display();
}

//void endScreen() {
//  background(255);
//}

void settingScreen() {
  background(255);
  buttons[0].display();
  buttons[0].hover();
  image(backArrow, 20, 20, 30, 30);

  textAlign(CENTER, CENTER);
  text("Settings", width/2, 25);
}

void creditScreen() {
  background(255);
  buttons[0].display();
  buttons[0].hover();
  image(backArrow, 20, 20, 30, 30);
  otherButtons[0].display();
  otherButtons[0].hover();
  image(githubLogo, 420, 345, 50, 50);

  fill(0);
  text("Credits", width/2, 25);
  text("Developer: Jonathan Su", width/2, 80);
  text("Written in: Processing", width/2, 120);
  text("Description: ", width/2, 160);

  textFont(finePrint);
  text("All rights reserved. No part of this publication may be reproduced,", width/2, 405);
  text("distributed, or transmitted in any form or by any means, including", width/2, 420);
  text("photocopying, recording, or other electronic or mechanical methods,", width/2, 435);
  text("without the prior written permission of the publisher, except in the case of", width/2, 450);
  text("brief quotations embodied in critical reviews and certain other", width/2, 465);
  text("noncommercial uses permitted by copyright law.", width/2, 480);
}
