class Component {
  Level currentLevel; // Til af refere til nuværende bane
  float x;
  float y;
  float w;
  float h;
  PImage graphic;
  PVector location;
  PVector velocity;
  float groundY;
  PApplet PMainObj;
  
  Component() {
    location = new PVector();
    velocity = new PVector();
  }
  
  // Metode der opdatere banens hastighed
  void updateSpeed() {
    velocity.x = currentLevel.moveSpeed;
  }
}
