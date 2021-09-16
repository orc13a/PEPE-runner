class PEPErunnerGame {
  Player player;
  Level level;
  
  PEPErunnerGame() {
    level = new Level(true);
    player = new Player(level);
  }
  
  void display() {
    rectMode(CENTER);
    imageMode(CENTER);
    
    level.display();
    player.display();
    
    if (level.pauseGame == false) {
      level.update();
      player.update();
    }
    
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
    
    rectMode(CORNER);
    imageMode(CORNER);
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
  
  void mousePress() {
    if (level.pauseBtn.clickCheck() == true && level.pauseBtn.hidden == false) {
      level.setGamePause();
    }
  }
}
