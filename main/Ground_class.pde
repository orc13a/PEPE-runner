class Ground extends Component {
  int inRow;
  int rowLength;
  
  Ground(Level l, int inRow_, int rowLength_) {
    currentLevel = l;
    inRow = inRow_;
    rowLength = rowLength_;
    
    graphic = loadImage("ground.png");
    w = 1482; // Billedets fil længde
    
    location.x = (width * inRow) - (w / 2);
    location.y = height + 3;
    
    updateSpeed();
  }
  
  // Displayer billedet
  void display() {
    image(graphic, location.x, location.y);
  }
  
  // Metode som rykker på jorden
  void update() {
    updateSpeed();
    
    location.add(velocity);
    
    if (location.x < -(w/2)) {
      updatePos();
    }
  }
  
  // Metode som opdatere billedets position.
  void updatePos() {
    inRow = rowLength;
    location.x = (width * inRow) - (w / 2);
  }
}
