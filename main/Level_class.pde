class Level extends Component {
  boolean infinity; // Om banen skal være uendelig
  float moveSpeedBefore;
  float moveSpeed = -5; //Jorden og forhindringernes hastighed
  Player player;
  ArrayList<Obstacle> allObstacles = new ArrayList<Obstacle>();
  ArrayList<Ground> allGround = new ArrayList<Ground>();
  float obstaclePosBefore = 0; //Forrige forhindrings startposition
  boolean levelStart = false;
  int rounds = 0; //Den tæller hver gang der er lavet x antal forhindringer
  boolean changeSpeed = true;
  Button pauseBtn;
  boolean pauseGame = false;
  boolean showGameoverMenu = false;
  boolean showPauseMenu = false;
  Score levelScore;
  
  Level(boolean mapType) {
    infinity = mapType; // Maptype er om banen er uendelig, eller har en max længde
    groundY = height - 100;
    
    graphic = loadImage("background.jpeg");
    
    for (int i = 0; i < 4; i++) {
      Ground ground = new Ground(this, (i + 1), 4);
      allGround.add(ground);
    }
    
    createObstacles();
    
    pauseBtn = new Button(loadImage("pepe-pause-button.png"), (width - 50), 50, 45, 45);
    pauseBtn.hidden = false;
    
    levelScore = new Score(this);
  }
  //Metode som viser jorden, pause knappen og scoren
  void display() {
    image(graphic, (width / 2), (height / 2));
    
    for (Ground g : allGround) {
      g.display();
    }
    
    if (pauseGame == false) {
      pauseBtn.display();
    }
    
    // Tegner og opdatere alle forhindingerne
    for (int i = 0; i < allObstacles.size(); i++) {
      Obstacle obs = allObstacles.get(i);
      
      obs.display();
      obs.update();
      obs.playerHitCheck();
      
      if (obs.location.x < (0 - obs.w)) {
        allObstacles.remove(i);
        i--;
      }
    }
    
    levelScore.display();
  }
  //Metode som laver forhindringer, og ændre banens hastighed
  void update() {
    createObstacles();
    for (Ground g : allGround) {
      g.update();
    }
    
    if (rounds % 9 == 0) {
      changeSpeed = true;
    }
    
    if (rounds % 10 == 0 && changeSpeed == true) {
      moveSpeed -= 1;
      changeSpeed = false;
    }
    
    levelScore.update();
  }
  //metoden som kan lave forhindringerne
  void createObstacles() {
    if (allObstacles.size() == 4) {
      rounds++;
      //obstaclePosBefore = 0;
    }
    
    if (allObstacles.size() < 5) {
      for (int i = 0; i < 4 && allObstacles.size() != 5; i++) {
        Obstacle newObs = new Obstacle(this, int(random(1, 4)), x);
        allObstacles.add(newObs);
      }
    }
  }
  //Metode som bestemmer om spillet skal pauses
  void setGamePause() {
    if (pauseGame == false) {
      pauseGame = true;
      showPauseMenu = true;
      moveSpeedBefore = moveSpeed;
      moveSpeed = 0;
    } else {
      moveSpeed = moveSpeedBefore;
      pauseGame = false;
    }
  }
}
