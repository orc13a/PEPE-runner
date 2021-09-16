class PEPErunnerGame {
  Player player;
  Level level;
  PFont gameFont;
  PFont PDefaultFont;
  Button playAgainBtn;
  Button continueBtn;
  Button menuBtn;
  Button exitBtn;
  
  PEPErunnerGame() {
    level = new Level(true);
    player = new Player(level);
    
    gameFont = createFont("PurplePurse-Regular.ttf", 12);
    PDefaultFont = createFont("Lucidia Grande", 12);
    
    playAgainBtn = new Button(loadImage("PepebuttonSpilIgen.png"), (width / 2), (height / 2) - 100, 265, 65);
    continueBtn = new Button(loadImage("PepebuttonFortsæt.png"), (width / 2), (height / 2) - 100, 265, 65);
    menuBtn = new Button(loadImage("PepebuttonMenu.png"), (width / 2), (height / 2), 265, 65);
    exitBtn = new Button(loadImage("PepebuttonAfslut.png"), (width / 2), (height / 2) + 100, 265, 65);
  }
  
  void display() {
    rectMode(CENTER);
    imageMode(CENTER);
    textAlign(CENTER);
    textFont(gameFont);
    
    level.display();
    player.display();
    
    if (level.pauseGame == false) {
      if (level.showPauseMenu == true) {
        continueBtn.hidden = true;
        menuBtn.hidden = true;
        exitBtn.hidden = true;
        level.showPauseMenu = false;
      }
      
      level.update();
      player.update();
    } else {
      if (level.showPauseMenu == true) {
        continueBtn.hidden = false;
        menuBtn.hidden = false;
        exitBtn.hidden = false;
      }
    }
    
    if (level.showGameoverMenu == true && level.pauseGame == true) {
      playAgainBtn.hidden = false;
      menuBtn.hidden = false;
      exitBtn.hidden = false;
    } else {
      playAgainBtn.hidden = true;
      menuBtn.hidden = true;
      exitBtn.hidden = true;
    }
    
    playAgainBtn.display();
    continueBtn.display();
    menuBtn.display();
    exitBtn.display();
    
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
    
    if (playAgainBtn.clickCheck() == true && playAgainBtn.hidden == false) {
      level = new Level(true);
      player = new Player(level);
    }
    
    if (continueBtn.clickCheck() == true && continueBtn.hidden == false) {
      level.setGamePause();
    }
    
    if (menuBtn.clickCheck() == true && menuBtn.hidden == false) {
      
    }
    
    if (exitBtn.clickCheck() == true && exitBtn.hidden == false) {
      exit();
    }
  }
}
