// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

Mover mover;

void setup() {
  size(640,360);
  mover = new Mover(); 
}

void draw() {
  background(255);
  
  mover.update();
  mover.checkEdges();
  mover.display(); 
}

void keyPressed() {
  if (key == CODED && keyCode == RIGHT) {
    mover.acceleration = new PVector (1,0);
  }
  
  if (key == CODED && keyCode == LEFT) {
    mover.acceleration = new PVector (-1,0);
  }
    if (key == CODED && keyCode == UP) {
    mover.acceleration = new PVector (0,-1);
  }
  
  if (key == CODED && keyCode == DOWN) {
    mover.acceleration = new PVector (0,1);
  }
  
}
