class Player extends Component {
  Level currentLevel;
  
  Player(Level l) {
    currentLevel = l;
    
    w = 50;
    h = 100;
    
    location.x = 200;
    location.y = currentLevel.groundY - (h / 2);
  }
  
  void display() {
    body();
  }
  
  void body() {
    fill(0);
    rect(location.x, location.y, w, h);
  }
  
  void update() {
  
  }
  
  void jump() {
  
  }
}
