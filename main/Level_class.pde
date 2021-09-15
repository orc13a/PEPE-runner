class Level extends Component {
  boolean infinity; // Om banen skal være uendelig
  float moveSpeed = -5;
  Player player;
  ArrayList<Obstacle> allObstacles = new ArrayList<Obstacle>();
  float obstaclePosBefore = 0;
  PImage ground;
  PImage background;
  
  Level(boolean mapType) {
    infinity = mapType;
    groundY = height - 100;
    
    ground = loadImage("ground.png");
    
    createObstacle();
  }
  
  void display() {
    ground();
  }
  
  void ground() {
    line(0, height - 100, width, height - 100);
  }
  
  void createObstacle() {
    Obstacle newObs = new Obstacle(this, int(random(1, 4)));
    allObstacles.add(newObs);
    Obstacle newObs2 = new Obstacle(this, int(random(1, 4)));
    allObstacles.add(newObs2);
    Obstacle newObs3 = new Obstacle(this, int(random(1, 4)));
    allObstacles.add(newObs3);
  }
}
