class Level extends Component {
  boolean infinity; // Om banen skal være uendelig
  float moveSpeed = -5;
  Player player;
  ArrayList<Obstacle> allObstacles = new ArrayList<Obstacle>();
  ArrayList<Ground> allGround = new ArrayList<Ground>();
  float obstaclePosBefore = 0;
  boolean levelStart = false;
  int rounds = 0;
  boolean changeSpeed = true;
  Button pauseBtn;
  
  Level(boolean mapType) {
    infinity = mapType;
    groundY = height - 100;
    
    graphic = loadImage("background.jpeg");
    
    for (int i = 0; i < 4; i++) {
      Ground ground = new Ground(this, (i + 1), 4);
      allGround.add(ground);
    }
    
    createObstacles();
    pause
  }
  
  void display() {
    println(moveSpeed);
    image(graphic, (width / 2), (height / 2));
    for (Ground g : allGround) {
      g.display();
    }
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
}
