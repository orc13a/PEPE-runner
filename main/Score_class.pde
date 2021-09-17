class Score extends Component {
  int currentScore = 0;
  int counter = 0;
  int highscore = 0;
  PImage scoreBoard;
  PImage HSBoard;
  Table HSTable;
  boolean tableSaved = false;
  
  Score(Level l) {
    currentLevel = l;
    
    HSTable = loadTable("highscores.csv", "header");
    getHS();
    
    scoreBoard = loadImage("point-board.png");
    HSBoard = loadImage("HS-board.png");
  }
  //Her tegnes score og highscore
  void display() {
    fill(0);
    textSize(18);
    
    image(scoreBoard, 125, 50, 200, 50);
    text(currentScore, 200, 56);
    
    image(HSBoard, 125, 112.5, 200, 50);
    text(highscore, 200, 118.5);
  }
  //Her opdateres scoren, ved hvert 12 counter
  void update() {
    counter++;
    
    if (counter % 12 == 0) {
      currentScore++;
    }
  }
  //Metode som kigger is CSV filen og finder highscore
  void getHS() {  
    try {
      for (TableRow row : HSTable.rows()) {
        int rowHSvalue = row.getInt("highscore");
        
        if (rowHSvalue > highscore) {
          highscore = rowHSvalue;
        }
      }
    } catch (ArrayIndexOutOfBoundsException e) {
      highscore = 0;
    }
  }
  //Metode som gemmer highscore i CSV filen, når man dør
  void saveHS() {
    if (tableSaved == false) {
      TableRow newRow = HSTable.addRow();
      newRow.setInt("id", HSTable.lastRowIndex() + 1);
      newRow.setInt("highscore", currentScore);
      
      saveTable(HSTable, "data/highscores.csv");
      tableSaved = true;
    }
  }
}
