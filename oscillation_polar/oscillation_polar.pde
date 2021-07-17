Mover mover;

void setup() {
  size(1000,800);
  background(255,229,204);
  mover = new Mover(1,30,30);
}

//void draw() {
//    if (frameCount % 10 == 0) {
//    //background(255,229,204);
//    fill(frameCount * 3 % 255, frameCount * 5 % 255,
//      frameCount * 7 % 255);
//    pushMatrix();
//    translate(400, 300);
//    rotate(radians(frameCount * 2  % 360));
//    ellipse(x,y,10,10);
//    ellipse(x+100,y+100,10,10);
//    line(x,y,x+100,y+100);
//    popMatrix();
//  }
  

void draw() {
  mover.update();
  mover.display();

}
