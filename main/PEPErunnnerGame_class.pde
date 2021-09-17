class PEPErunnerGame { 
  Player player;
  Level level;
  PFont gameFont;
  PFont PDefaultFont;
  PImage mainmenuBGimage;
  SoundFile themeMusic;
  Button playBtn;
  Button playAgainBtn;
  Button continueBtn;
  Button settingsBtnM;
  Button exitBtnM;
  Button menuBtnP;
  Button exitBtnP;
  Button menuBtnD;
  Button exitBtnD;
  Menu mainMenu;
  Menu pauseMenu;
  Menu gameoverMenu;
  
  PEPErunnerGame(PApplet PMain) {
    surface.setTitle("PEPE-runner game");
    //level = new Level(true);
    //player = new Player(level);
    
    gameFont = createFont("PurplePurse-Regular.ttf", 12);
    PDefaultFont = createFont("Lucidia Grande", 12);
    
    themeMusic = new SoundFile(PMain, "PEPE-theme-song.mp3");
    themeMusic.loop();
    
    // Main menu init --------------------
    
    mainmenuBGimage = loadImage("mainmenu-background.png");
    
    mainMenu = new Menu("PEPE-runner");
    
    playBtn = new Button(loadImage("PepebuttonSpil.png"), (width / 2), (height / 2) - 100, 265, 65);
    settingsBtnM = new Button(loadImage("PepebuttonIndstillinger.png"), (width / 2), (height / 2), 265, 65);
    exitBtnM = new Button(loadImage("PepebuttonAfslut.png"), (width / 2), (height / 2) + 100, 265, 65);
    
    mainMenu.allButtons.add(playBtn);
    mainMenu.allButtons.add(settingsBtnM);
    mainMenu.allButtons.add(exitBtnM);
    
    mainMenu.show();
    
    // Game menus init --------------------
    
    pauseMenu = new Menu("Pause");
    gameoverMenu = new Menu("Game Over");
    
    playAgainBtn = new Button(loadImage("PepebuttonSpilIgen.png"), (width / 2), (height / 2) - 100, 265, 65);
    continueBtn = new Button(loadImage("PepebuttonFortsæt.png"), (width / 2), (height / 2) - 100, 265, 65);
    menuBtnP = new Button(loadImage("PepebuttonMenu.png"), (width / 2), (height / 2), 265, 65);
    exitBtnP = new Button(loadImage("PepebuttonAfslut.png"), (width / 2), (height / 2) + 100, 265, 65);
    menuBtnD = new Button(loadImage("PepebuttonMenu.png"), (width / 2), (height / 2), 265, 65);
    exitBtnD = new Button(loadImage("PepebuttonAfslut.png"), (width / 2), (height / 2) + 100, 265, 65);
    
    pauseMenu.allButtons.add(continueBtn);
    pauseMenu.allButtons.add(menuBtnP);
    pauseMenu.allButtons.add(exitBtnP);
    
    gameoverMenu.allButtons.add(playAgainBtn);
    gameoverMenu.allButtons.add(menuBtnD);
    gameoverMenu.allButtons.add(exitBtnD);
    
    // ----------------------------------------
  }
  //Metode som viser hovedmenuen
  void display() {
    rectMode(CENTER);
    imageMode(CENTER);
    textAlign(CENTER);
    textFont(gameFont);
    
    if (mainMenu.showMenu == false) {
      runGame();
    } else {
      image(mainmenuBGimage, (width / 2), (height / 2), width, height);
      mainMenu.display();
    }
    
    rectMode(CORNER);
    imageMode(CORNER);
    textAlign(LEFT);
    textFont(PDefaultFont);
  }
  //Metoden som faktisk tegner spillet
  private void runGame() {
    level.display();
    player.display();
    
    if (level.pauseGame == false && level.showGameoverMenu == false) {
      level.update();
      player.update();
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
  }
  //Metode der sætter knapperne til at kontrollere spilleren, og deres aktion
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
  //Metode som kigger efter hvornår knap er sluppet
  void keysReleased() {
    if (key == CODED) {
      if (keyCode == DOWN) {
        player.crouch(false);
      }
    }
  }
  //Metode som kigger om spillets knapper bliver trykket på af musen, samt giver deres aktion
  void mousePress() {
    if (mainMenu.showMenu == false) {
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
        mainMenu.show();
      }
      
      if (exitBtnP.clickCheck() == true && exitBtnP.hidden == false) {
        exit();
      }
      
      if (menuBtnD.clickCheck() == true && menuBtnD.hidden == false) {
        mainMenu.show();
      }
      
      if (exitBtnD.clickCheck() == true && exitBtnD.hidden == false) {
        exit();
      }
    } else {
      if (playBtn.clickCheck() == true && playBtn.hidden == false) {
        mainMenu.hide();
        level = new Level(true);
        player = new Player(level);
      }
      
      if (settingsBtnM.clickCheck() == true && settingsBtnM.hidden == false) {
        
      }
      
      if (exitBtnM.clickCheck() == true && exitBtnM.hidden == false) {
        exit();
      }
    }
  }
}
