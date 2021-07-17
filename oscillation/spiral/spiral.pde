//polar to cartesian
Mover mover;

void setup() {
  size(600,400);
   background(255,100,200);
  mover = new Mover();
}

void draw() {
  mover.update();
  mover.display();
  
}

void keyPressed() {
  if (key == CODED && keyCode == RIGHT) {
    mover.spiral_width = -1;
    mover.c = 0;
    mover.reset();
  }
  
  else if (key == CODED && keyCode == LEFT) {
    mover.spiral_width = 1;
    mover.c = 255;
    mover.reset();
  }
  
  else if (key == ' ') {
    mover.spWidth_increment = 0;
    mover.angle_increment = 0;
  }
  
}
