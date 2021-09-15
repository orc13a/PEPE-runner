class Obstacle extends Component {
  Level currentLevel;
  int obsType;
  
  Obstacle(Level l, int obsType_) {
    currentLevel = l;
    obsType = obsType_;
    
    w = 60;
    h = 40;
    
    // Sæt random x ude for skærmen
    location.x = 800;
    
    if (obsType == 1) { // fugl
      graphic = loadImage("pepebird.png");
      int flyHeight = int(random(1,4));
      
      if (flyHeight == 1) {
        location.y = currentLevel.groundY - (h - 10);
      }
      
      if (flyHeight == 2) {
        location.y = currentLevel.groundY - (h + 50);
      }
      
      if (flyHeight == 3) {
        location.y = currentLevel.groundY - 145;
      }
      
      updateSpeed();
    }
  }
  
  void display() {
    image(graphic, location.x, location.y, w, h);
  }
  
  void update() {
    location.add(velocity);
  }
  
  void updateSpeed() {
    velocity.x = currentLevel.moveSpeed;
  }
  
  void playerHitCheck() {
    if (currentLevel.player.location.x + (currentLevel.player.w / 2) > location.x - (w / 2) &&
        currentLevel.player.location.x - (currentLevel.player.w / 2) < location.x + (w / 2) && 
        currentLevel.player.location.y + (currentLevel.player.h / 2) > location.y - (h / 2) &&
        currentLevel.player.location.y - (currentLevel.player.h / 2) < location.y + (h / 2)) {
      println("HIT");
    }
  }
}
