class Player extends Component {
  Level currentLevel;
  boolean jumping = false;
  boolean onGround = true;
  
  Player(Level l) {
    currentLevel = l;
    
    w = 50;
    h = 100;
    
    location.x = 200;
    location.y = currentLevel.groundY - (h / 2);
    
    velocity.y = -10;
  }
  
  void display() {
    body();
  }
  
  void body() {
    fill(0);
    rect(location.x, location.y, w, h);
  }
  
  void update() {
    if (location.y <= 275 && groundCheck() == false) {
      jumping = false;
      velocity.y = 0;
      delay(75);
      velocity.y = 10;
    }
    
    if (jumping == true) {
      location.add(velocity);
    }
    
    if (groundCheck() == false && jumping == false) {
      location.add(velocity);
    }
  }
  
  void jump() {
    if (groundCheck() == true) {
      if (velocity.y > 0) {
        velocity.y *= -1;
      }
      jumping = true;
    }
  }
  
  void crouch(boolean keyP) {
    if (groundCheck() == true && keyP == true) {
      h = 45;
      location.y = currentLevel.groundY - (h / 2);
    }
    
    if (groundCheck() == true && keyP == false) {
      h = 100;
      location.y = currentLevel.groundY - (h / 2);
    }
  }
  
  boolean groundCheck() {
    if (location.y + (h / 2) >= currentLevel.groundY) {
      return true;
    } else {
      return false;
    }
  }
}
