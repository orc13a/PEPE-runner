class Score extends Component {
  int currentScore = 0;
  PImage scoreBoard;
  PImage HSBoard;
  
  Score(Level l) {
    currentLevel = l;
    scoreBoard = loadImage("point-board.png");
    HSBoard = loadImage("HS-board.png");
  }
  
  void display() {
    textSize(18);
    
    image(scoreBoard, 125, 50, 200, 50);
    text(currentScore, 200, 56);
    
    image(HSBoard, 125, 112.5, 200, 50);
    text(currentScore, 200, 118.5);
  }
  
  void update() {
    
  }
}
