// ----------------------------------------
// Gustav og Oliver C
// ----------------------------------------
import processing.sound.*;

PEPErunnerGame game;

void setup() {
  size(1200, 600);
  smooth(8);
  // pixelDensity(2);
  frameRate(60);
  
  // Spillet skal bruge Processing main objekt til at kunne arbejde med Sound bibloteket
  game = new PEPErunnerGame(this);
}

void draw() {
  clear();
  background(255);
  
  game.display();
}

void keyPressed() {
  game.keysPressed();
}

void keyReleased() {
  game.keysReleased();
}

void mousePressed() {
  game.mousePress();
}
