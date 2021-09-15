class Component {
  Level currentLevel;
  float x;
  float y;
  float w;
  float h;
  PImage graphic;
  PVector location;
  PVector velocity;
  float groundY;
  
  Component() {
    location = new PVector();
    velocity = new PVector();
  }
  
  void updateSpeed() {
    velocity.x = currentLevel.moveSpeed;
  }
}
