void setup() {
  size(800, 200);
  smooth();
}

void draw() {
  background(255);
  
  PVector mouse = new PVector(mouseX,mouseY);
  PVector center = new PVector(width/2,height/2);
  mouse.sub(center);
  
  // Multiplying a vector!  The vector is now half its original size (multiplied by 0.5).
  //mouse.div(5);  
  
  //float m = mouse.mag();
  //fill(0);
  //rect(0,0,m,10);
  
  mouse.normalize();
  
  mouse.mult(50);
  
  translate(width/2,height/2);
  strokeWeight(2);
  stroke(0);
  line(0,0,mouse.x,mouse.y);
}
