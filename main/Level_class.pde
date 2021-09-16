class Level extends Component {
  boolean infinity; // Om banen skal være uendelig
  float moveSpeedBefore;
  float moveSpeed = -5;
  Player player;
  ArrayList<Obstacle> allObstacles = new ArrayList<Obstacle>();
  ArrayList<Ground> allGround = new ArrayList<Ground>();
  float obstaclePosBefore = 0;
  boolean levelStart = false;
  int rounds = 0;
  boolean changeSpeed = true;
  Button pauseBtn;
  boolean pauseGame = false;
  Score levelScore;
  
  Level(boolean mapType) {
    infinity = mapType;
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
  
  void display() {
    image(graphic, (width / 2), (height / 2));
    
    for (Ground g : allGround) {
      g.display();
    }
    
    pauseBtn.display();
    
    levelScore.display();
  }
  
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
  }
  
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
  
  void setGamePause() {
    if (pauseGame == false) {
      pauseGame = true;
      moveSpeedBefore = moveSpeed;
      moveSpeed = 0;
    }
  }
}
