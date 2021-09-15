class Level extends Component {
  boolean infinity; // Om banen skal være uendelig
  float moveSpeed = -5;
  Player player;
  ArrayList<Obstacle> allObstacles = new ArrayList<Obstacle>();
  ArrayList<Ground> allGround = new ArrayList<Ground>();
  float obstaclePosBefore = 0;
  boolean levelStart = false;
  
  Level(boolean mapType) {
    infinity = mapType;
    groundY = height - 100;
    
    graphic = loadImage("background.jpeg");
    
    for (int i = 0; i < 3; i++) {
      Ground ground = new Ground(this, (i + 1), 3);
      allGround.add(ground);
    }
    
    createObstacles();
  }
  
  void display() {
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
  }
  
  void createObstacles() {
    if (allObstacles.size() < 5) {
      for (int i = 0; i < 4 && allObstacles.size() != 5; i++) {
        
        Obstacle newObs = new Obstacle(this, int(random(1, 4)), x);
        allObstacles.add(newObs);
      }
    }
  }
  
  void changeSpeed() {
    moveSpeed *= 2;
  }
}
