class Level extends Component {
  boolean infinity; // Om banen skal være uendelig
  float moveSpeed = -5;
  Player player;
  ArrayList<Obstacle> allObstacles = new ArrayList<Obstacle>();
  
  Level(boolean mapType) {
    infinity = mapType;
    groundY = height - 100;
    
    createObstacle();
  }
  
  void display() {
    ground();
  }
  
  void ground() {
    line(0, height - 100, width, height - 100);
  }
  
  void createObstacle() {
    Obstacle newObs = new Obstacle(this);
    allObstacles.add(newObs);
  }
  
  void playerHitCheck() {
  
  }
}
