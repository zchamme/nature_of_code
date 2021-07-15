class Attractor {
  float mass;
  PVector position;
  
  Attractor() {
    position = new PVector(mouseX,mouseY);
    mass = 40;
  }
  
  void display() {
    fill(map(position.x,0,width,0,255),map(position.y,0,height,0,255),mass,50);
    strokeWeight(0.5);
    ellipse(position.x, position.y, mass*0.5, mass*0.5);
  }
}
//{"mode":"full","isActive":false}
