class Player extends Component {
  boolean jumping = false; // Om spilleren hopper
  boolean crouching = false; // Om spiller sidder ned
  boolean goDown = false; // Om spilleren vil hurtigt ned fra luften
  boolean slow = false; // Om spilleren er kommer helt op
  float jumpSpeed = 10; // Hastighed spilleren hopper og falde
  float jumpSlowSpeed = -3; // Hastighed for at blive længere i luften
  float goDownSpeed = 23; // Hastigheden for når spilleren vil hurtigt ned
  
  Player(Level l) {
    currentLevel = l; // Gemmer den bane spilleren har startet
    currentLevel.player = this;
    graphic = loadImage("pepeman.png");
    
    w = 85;
    h = 100;
    
    location.x = 200;
    location.y = currentLevel.groundY - (h / 2);
    
    velocity.y = -jumpSpeed;
  }
  //Metode som viser spilleren
  void display() {
    body();
  }
  
  void body() {
    image(graphic, location.x, location.y, w, h);
  }
  
  // Opdatere spillerens værdiere
  void update() {
    // Hvis spilleren kommer under 300 y, så skal spilleren hoppe langsomere (for at blive længere i luften)
    if (location.y <= 300 && groundCheck() == false && slow == false) {
      // Hvis spilleren ikke vil hurtigt ned
      if (goDown == false) {
        jumping = false;
        velocity.y = jumpSlowSpeed;
      }
    }
    
    // Når spilleren er kommet til maks højde, så spilleren falde ned igen
    if (location.y <= 275 && groundCheck() == false) {
      // Hvis spilleren ikke vil hurtigt ned
      if (goDown == false) {
        jumping = false;
        velocity.y = jumpSpeed;
        slow = true;
      }
    }
    
    // Når man har trykket hop
    if (jumping == true) {
      location.add(velocity);
    }
    
    // Når spilleren skal falde ned igen
    if (groundCheck() == false && jumping == false) {
      location.add(velocity);
    }
    
    // Sæt spilleren til at stå på jorden når er landet igen
    if (groundCheck() == true && jumping == false) {
      location.y = currentLevel.groundY - (h / 2);
    }
  }
  
  // Spilleren til at hoppe
  void jump() {
    // Hvis spilleren står på jorden og ikke sidder ned
    if (groundCheck() == true && crouching == false) {
      // Nulstiller hoppe kraften
      if (velocity.y >= 0) {
        velocity.y = -jumpSpeed;
      }
      slow = false;
      jumping = true;
    }
  }
  
  // Gør at spilleren kan gå hurtigt ned når spilleren er i luften
  void goDown() {
    // Hvis spilleren ikke er på jorden
    if (groundCheck() == false) {
      goDown = true;
      velocity.y = goDownSpeed;
      jumping = false;
    }
  }
  
  // Gør at spilleren kan side ned
  void crouch(boolean keyP) {
    if (groundCheck() == false) {
      goDown();
    }
    
    // Hvis man vil side ned
    if (groundCheck() == true && keyP == true) {
      crouching = true;
      h = 45;
      location.y = currentLevel.groundY - (h / 2);
      goDown = false;
    }
    
    // Når man giver slip på knappen
    if (groundCheck() == true && keyP == false) {
      crouching = false;
      h = 100;
      location.y = currentLevel.groundY - (h / 2);
      goDown = false;
    }
  }
  
  // Tjekker om spilleren er på jorden
  boolean groundCheck() {
    if (location.y + (h / 2) >= currentLevel.groundY) {
      return true;
    } else {
      return false;
    }
  }
}
