class PEPErunnerGame {
  Player player;
  Level level;
  
  PEPErunnerGame() {
    level = new Level(true);
    player = new Player(level);
  }
  
  void display() {
    level.display();
    player.display();
    player.update();
    
    for (Obstacle obs : level.allObstacles) {
      obs.display();
      obs.update();
    }
  }
  
  void keysPressed() {    
    if (key == ' ') {
      player.jump();
    }
    
    if (key == CODED) {
      if (keyCode == UP) {
        player.jump();
      }
      
      if (keyCode == DOWN) {
        player.crouch(true);
      }
    }
  }
  
  void keysReleased() {
    if (key == CODED) {
      if (keyCode == DOWN) {
        player.crouch(false);
      }
    }
  }
}
