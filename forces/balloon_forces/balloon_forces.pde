PImage balloon;
Mover mover;

void setup() {
  size(640,360);
  balloon = loadImage("balloon.jpg");
  mover = new Mover();
}

void draw() {
  background(255);

  mover.update();
  mover.checkEdges();
  mover.display(); 
}
