class PEPErunnerGame {
  Player player;
  Level level;
  PFont gameFont;
  PFont PDefaultFont;
  
  PEPErunnerGame() {
    level = new Level(true);
    player = new Player(level);
    
    gameFont = createFont("PurplePurse-Regular.ttf", 12);
    PDefaultFont = createFont("Lucidia Grande", 12);
  }
  
  void display() {
    rectMode(CENTER);
    imageMode(CENTER);
    textAlign(CENTER);
    textFont(gameFont);
    
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
    textAlign(LEFT);
    textFont(PDefaultFont);
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
