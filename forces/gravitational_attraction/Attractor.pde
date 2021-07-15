class Attractor {
  float mass;
  float G;
  PVector position;
  float damp;
  
  Attractor() {
    position = new PVector (random(width),random(height));
    mass = 100;
    G = 4;
    //damp = 0.004;
  }
  
  //void display(){ 
  //  stroke(0);
  //  fill(0,200);
  //  ellipse(position.x,position.y,mass*0.5,mass*0.5);
  //  //point(position.x, position.y);
  //}
  
  PVector attract(Mover m) {
    //direction of force
    PVector force = PVector.sub(position, m.position);
    //magnitude of force
    float distance = force.mag();
    distance = constrain(distance,1,100.0);
    float magnitude = ((G * mass * m.mass) / (distance*distance));
    force.normalize();
    force.mult(magnitude);
    
    return force;
  }
}
