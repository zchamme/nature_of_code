Mover mover;

void setup() {
  size(600,400);
  background(255,229,204);
  mover = new Mover(1,width/2,height/2);
}

void draw() {
  mover.update();
  mover.display();

}
