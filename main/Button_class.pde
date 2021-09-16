class Button extends Component {
  boolean hidden = true;
  
  Button(PImage img, float x_, float y_, float w_, float h_) {
    graphic = img;
    x = x_;
    y = y_;
    w = w_; 
    h = h_;
  }
  
  void display() {
    if (hidden == false) {
      image(graphic, x, y, w, h);
    }
  }
  
  boolean clickCheck() {
    if (mouseX > x - (w / 2) && mouseX < x + (w / 2) && mouseY > y - (h / 2) && mouseY < y + (h / 2)) {
      if (hidden == false) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}