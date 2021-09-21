class Level extends Component {
  boolean infinity; // Om banen skal være uendelig
  float moveSpeedBefore; // Til at gemme hastigheden
  float moveSpeed = -5; //Jorden og forhindringernes hastighed
  Player player; // Nuværende spiller objekt
  ArrayList<Obstacle> allObstacles = new ArrayList<Obstacle>(); // Alle forhindringer
  ArrayList<Ground> allGround = new ArrayList<Ground>(); // Alle jord billeder
  float obstaclePosBefore = 0; //Forrige forhindrings startposition
  int rounds = 0; //Den tæller hver gang der er lavet x antal forhindringer
  boolean changeSpeed = true;
  Button pauseBtn;
  boolean pauseGame = false;
  boolean showGameoverMenu = false;
  boolean showPauseMenu = false;
  Score levelScore;
  boolean playedDieSound;
  SoundFile dieSound;
  SoundFile jumpSound;
  
  Level(boolean mapType, PApplet PMain_) {
    infinity = mapType; // Maptype er om banen er uendelig, eller har en max længde
    groundY = height - 100;
    
    PMainObj = PMain_;
    playedDieSound = false;
    
    graphic = loadImage("background.jpeg");
    
    // Der laves 4 jord som skal tegnes i et loop til at lige jorden er uendelig
    for (int i = 0; i < 4; i++) {
      Ground ground = new Ground(this, (i + 1), 4);
      allGround.add(ground);
    }
    
    createObstacles();
    
    pauseBtn = new Button(PMainObj, loadImage("pepe-pause-button.png"), (width - 50), 50, 45, 45);
    pauseBtn.hidden = false;
    
    levelScore = new Score(this);
    
    dieSound = new SoundFile(PMainObj, "die-soundeffect.mp3");
    jumpSound = new SoundFile(PMainObj, "jump-soundeffect.wav");
  }
  
  // Metode som viser jorden, pause knappen og scoren
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
  
  // Metode som laver forhindringer, og ændre banens hastighed
  void update() {
    createObstacles();
    
    for (Ground g : allGround) {
      g.update();
    }
    
    if (rounds % 9 == 0) {
      changeSpeed = true;
    }
    
    // Hver 10'ene forhindring som bliver slettet sættes hastigheden op
    if (rounds % 10 == 0 && changeSpeed == true) {
      moveSpeed -= 1;
      changeSpeed = false;
    }
    
    levelScore.update();
  }
  
  // Metoden som kan lave forhindringerne
  void createObstacles() {
    // Hver gang en forhindring er blevet slettet gå round op
    if (allObstacles.size() == 4) {
      rounds++;
    }
    
    if (allObstacles.size() < 5) {
      for (int i = 0; i < 4 && allObstacles.size() != 5; i++) {
        Obstacle newObs = new Obstacle(this, int(random(1, 4)), x);
        allObstacles.add(newObs);
      }
    }
  }
  
  // Metode som bestemmer om spillet skal pauses
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
