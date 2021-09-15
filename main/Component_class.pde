class Component extends PEPErunnerGame {
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
}
