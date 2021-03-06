class Menu extends Component {
  ArrayList<Button> allButtons = new ArrayList<Button>();
  boolean showMenu = false;
  String title = "";
  float titleX;
  float titleY;
  float titleSize;
  color titleColor = 0;
  color titleBGColor = #5C8E37;
  
  //Menu konstruktør uden titel
  Menu() {
    
  }
  
  //Menu Konstruktør med titel
  Menu(String title_) {
    title = title_;
    titleX = width / 2;
    titleY = 60;
    titleSize = 32;
  }
  
  // Metode der bestemmer om menu skal vises
  void show() {
    showMenu = true;
  }
  
  // Metode der bestemmer om menu skal gemmes
  void hide() {
    showMenu = false;
  }
  
  // Metode som viser menuen
  void display() {  
    if (showMenu == true) {
      fill(titleBGColor);
      strokeWeight(2);
      rect(titleX, titleY - 10, 300, 50, 8);
      
      fill(titleColor);
      textSize(titleSize);
      text(title, titleX, titleY);
      
      for (Button btn : allButtons) {
        btn.hidden = false;
        btn.display();
      }
    } else {
      for (Button btn : allButtons) {
        btn.hidden = true;
      }
    }
  }
  
  // Kan hente knap fra array og sende objektet tilbage
  Button getBtn(int index) {
    return allButtons.get(index);
  }
}
