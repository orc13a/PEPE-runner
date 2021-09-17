class Obstacle extends Component {
  int obsType;
  float posX;
  
  Obstacle(Level l, int obsType_,float posX_) {
    currentLevel = l;
    obsType = obsType_;
    posX = posX_;
    
    pickObstacle();
  }
  //Metoden som viser billede
  void display() {
    image(graphic, location.x, location.y, w, h);
  }
  //Metode som opdatere forhindringernes hastighed samt flytter dem, og checker om spillet er pauset
  void update() {
    updateSpeed();
    
    if (currentLevel.pauseGame == false) {
      location.add(velocity);
    }
  }
  //Metode som checker om spilleren rammer en forhindring
  void playerHitCheck() {
    if (currentLevel.player.location.x + (currentLevel.player.w / 2) - 20 > location.x - (w / 2) &&
        currentLevel.player.location.x - (currentLevel.player.w / 2) + 20 < location.x + (w / 2) && 
        currentLevel.player.location.y + (currentLevel.player.h / 2) - 20 > location.y - (h / 2) &&
        currentLevel.player.location.y - (currentLevel.player.h / 2) + 20 < location.y + (h / 2)) {
      currentLevel.pauseGame = true;
      currentLevel.showGameoverMenu = true;
      currentLevel.levelScore.saveHS();
    }
  }
  //Metode som vælger tilfældig forhindring, og placere den tilfældigt.
  void pickObstacle() {    
    location.x = random((currentLevel.obstaclePosBefore + 200), (currentLevel.obstaclePosBefore + 600));
    currentLevel.obstaclePosBefore = location.x;
    location.x += width;
    
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
      location.y = currentLevel.groundY - (h / 2) + 12;
    }
    
    updateSpeed();
  }
}
