class PEPErunnerGame {
  Player player;
  Level level;
  PFont gameFont;
  PFont PDefaultFont;
  Button playAgainBtn;
  Button continueBtn;
  Button menuBtnP;
  Button exitBtnP;
  Button menuBtnD;
  Button exitBtnD;
  Menu pauseMenu;
  Menu gameoverMenu;
  
  PEPErunnerGame() {
    level = new Level(true);
    player = new Player(level);
    
    gameFont = createFont("PurplePurse-Regular.ttf", 12);
    PDefaultFont = createFont("Lucidia Grande", 12);
    
    playAgainBtn = new Button(loadImage("PepebuttonSpilIgen.png"), (width / 2), (height / 2) - 100, 265, 65);
    continueBtn = new Button(loadImage("PepebuttonFortsæt.png"), (width / 2), (height / 2) - 100, 265, 65);
    menuBtnP = new Button(loadImage("PepebuttonMenu.png"), (width / 2), (height / 2), 265, 65);
    exitBtnP = new Button(loadImage("PepebuttonAfslut.png"), (width / 2), (height / 2) + 100, 265, 65);
    menuBtnD = new Button(loadImage("PepebuttonMenu.png"), (width / 2), (height / 2), 265, 65);
    exitBtnD = new Button(loadImage("PepebuttonAfslut.png"), (width / 2), (height / 2) + 100, 265, 65);
    
    pauseMenu = new Menu();
    gameoverMenu = new Menu();
    
    pauseMenu.allButtons.add(continueBtn);
    pauseMenu.allButtons.add(menuBtnP);
    pauseMenu.allButtons.add(exitBtnP);
    
    gameoverMenu.allButtons.add(playAgainBtn);
    gameoverMenu.allButtons.add(menuBtnD);
    gameoverMenu.allButtons.add(exitBtnD);
  }
  
  void display() {
    rectMode(CENTER);
    imageMode(CENTER);
    textAlign(CENTER);
    textFont(gameFont);
    
    level.display();
    player.display();
    
    if (level.pauseGame == false && level.showGameoverMenu == false) {
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
    
    if (level.pauseGame == true && level.showGameoverMenu != true) {
      pauseMenu.show();
    } else {
      pauseMenu.hide();
    }
    
    if (level.showGameoverMenu == true && level.pauseGame == true) {
      gameoverMenu.show();
    } else {
      gameoverMenu.hide();
    }
    
    pauseMenu.display();
    gameoverMenu.display();
    
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
    
    if (menuBtnP.clickCheck() == true && menuBtnP.hidden == false) {
      
    }
    
    if (exitBtnP.clickCheck() == true && exitBtnP.hidden == false) {
      exit();
    }
    
    if (menuBtnD.clickCheck() == true && menuBtnD.hidden == false) {
      
    }
    
    if (exitBtnD.clickCheck() == true && exitBtnD.hidden == false) {
      exit();
    }
  }
}
