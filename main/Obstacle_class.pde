class Obstacle extends Component {
  Level currentLevel;
  int obsType;
  
  Obstacle(Level l, int obsType_) {
    currentLevel = l;
    obsType = obsType_;
    
    pickObstacle();
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
    if (currentLevel.player.location.x + (currentLevel.player.w / 2) - 20 > location.x - (w / 2) &&
        currentLevel.player.location.x - (currentLevel.player.w / 2) + 20 < location.x + (w / 2) && 
        currentLevel.player.location.y + (currentLevel.player.h / 2) - 20 > location.y - (h / 2) &&
        currentLevel.player.location.y - (currentLevel.player.h / 2) + 20 < location.y + (h / 2)) {
      println("HIT");
    }
  }
  
  void pickObstacle() {    
    // Sæt random x ude for skærmen
    location.x = random(currentLevel.obstaclePosBefore, (currentLevel.obstaclePosBefore + 1));
    location.x += width;
    currentLevel.obstaclePosBefore = location.x;
    
    if (obsType == 1) { // fugl
      graphic = loadImage("pepebird.png");
      w = 60;
      h = 40;
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
    }
    
    if (obsType == 2) { // træ
      graphic = loadImage("tree.png");
      w = 60;
      h = 100;
      location.y = currentLevel.groundY - (h / 2) + 6;
    }
    
    if (obsType == 3) { // busk
      graphic = loadImage("bush.png");
      w = 100;
      h = 60;
      location.y = currentLevel.groundY - (h / 2);
    }
    
    updateSpeed();
  }
}
