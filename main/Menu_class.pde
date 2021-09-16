class Menu extends Component {
  ArrayList<Button> allButtons = new ArrayList<Button>();
  boolean showMenu = false;
  
  Menu() {
    
  }
  
  void show() {
    showMenu = true;
  }
  
  void hide() {
    showMenu = false;
  }
  
  void display() {
    if (showMenu == true) {
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
  
  Button getBtn(int index) {
    return allButtons.get(index);
  }
}
