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
    
    for (int i = 0; i < level.allObstacles.size(); i++) {
      Obstacle obs = level.allObstacles.get(i);
      
      obs.display();
      obs.update();
      obs.playerHitCheck();
      
      if (obs.location.x < (0 - obs.w)) {
        level.allObstacles.remove(i);
        i--;
      }
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
