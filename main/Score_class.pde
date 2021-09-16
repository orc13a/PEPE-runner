class Score extends Component {
  int currentScore = 0;
  int counter = 0;
  int highscore = 0;
  PImage scoreBoard;
  PImage HSBoard;
  Table HSTable;
  
  Score(Level l) {
    currentLevel = l;
    
    HSTable = loadTable("highscores.csv", "header");
    try {
      highscore = HSTable.getInt(HSTable.lastRowIndex(), "highscore");
    } catch (IllegalArgumentException e) {
      highscore = 0;
    }
    
    scoreBoard = loadImage("point-board.png");
    HSBoard = loadImage("HS-board.png");
  }
  
  void display() {
    textSize(18);
    
    image(scoreBoard, 125, 50, 200, 50);
    text(currentScore, 200, 56);
    
    image(HSBoard, 125, 112.5, 200, 50);
    text(highscore, 200, 118.5);
  }
  
  void update() {
    counter++;
    
    if (counter % 12 == 0) {
      currentScore++;
    }
  }
  
  void saveHS() {
    TableRow newRow = HSTable.addRow();
    newRow.setInt("highscore", HSTable.lastRowIndex());
    
    saveTable(HSTable, "data/highscores.csv");
  }
}
