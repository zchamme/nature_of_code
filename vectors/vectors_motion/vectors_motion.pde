// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

//exercise 1.5, 1.6

Mover mover;

void setup() {
  size(640,360);
  mover = new Mover(); 
}

void draw() {
  background(255);
  mover.update();
  //mover.changeDir();
  mover.checkEdges();
  mover.display(); 
}

//void mousePressed() {
//  mover.acceleration = new PVector();
//  mover.velocity = new PVector();
//}

void mousePressed() {
  mover.perlinAcc();
}

void mouseReleased(){
  mover.acceleration = new PVector();
  mover.velocity = new PVector();
}
//void mouseReleased() {
//  //mover.acceleration = new PVector(-0.001,0.01);
//  mover.acceleration = PVector.random2D();
//  mover.acceleration.mult(random(2));
//  mover.velocity = new PVector();  
//}
