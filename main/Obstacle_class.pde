class Obstacle extends Component {
  Level currentLevel;
  
  Obstacle(Level l) {
    currentLevel = l;
    
    graphic = loadImage("pepebird.png");
    
    location.x = 600;
    location.y = l.groundY - 145;
    velocity.x = l.moveSpeed;
    
    w = 60;
    h = 40;
  }
  
  void display() {
    image(graphic, location.x, location.y, w, h);
  }
  
  void update() {
    location.add(velocity);
  }
}
