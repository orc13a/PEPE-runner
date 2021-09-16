// ----------------------------------------
// Gustav og Oliver C
// ----------------------------------------

PEPErunnerGame game;

void setup() {
  size(1200, 600);
  smooth(8);
  // pixelDensity(2);
  
  game = new PEPErunnerGame();
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
