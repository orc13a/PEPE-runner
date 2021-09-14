// ----------------------------------------
// Gustav og Oliver C
// ----------------------------------------

Level l;
Player player;

void setup() {
  size(1200, 600);
  smooth(8);
  // pixelDensity(2);
  
  rectMode(CENTER);
  imageMode(CENTER);
  
  l = new Level(true);
  player = new Player(l);
}

void draw() {
  clear();
  background(255);
  
  l.display();
  player.display();
  player.update();
}

void keyPressed() {
  switch(key) {
    case ' ':
      player.jump();
  }
  
  if (key == CODED) {
    switch(keyCode) {
      case UP:
        player.jump();
      case DOWN:
        
    }
  }
}
