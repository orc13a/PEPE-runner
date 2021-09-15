class Level extends Component {
  boolean infinity; // Om banen skal være uendelig
  
  Level(boolean mapType) {
    infinity = mapType;
    groundY = height - 100;
  }
  
  void display() {
    ground();
  }
  
  void ground() {
    line(0, height - 100, width, height - 100);
  }
}
