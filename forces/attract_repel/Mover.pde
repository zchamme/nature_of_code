class Mover {
  
  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass;
  float G;
  
  Mover(float m, float x, float y) {
    position = new PVector(x,y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0.01,0.01);
    mass = m;
    G = 0.01;
  }
  
  void update() { 
     velocity.add(acceleration);
     position.add(velocity);
     acceleration.mult(0);
    
  }
  
  void display() {
    fill(map(position.x,0,width,0,255),map(position.y,0,height,0,255),mass,50);
    strokeWeight(0.5);
    ellipse(position.x, position.y, mass, mass);
  }
  
  void applyForce(PVector force) {
    //make copy of original force vector
    PVector f = force.copy();
    //Newton's second law: F = MxA
    f.div(mass);
    acceleration.add(f);
  }
  
  PVector repel(Mover m) {
    //direction of force
    PVector force = PVector.sub(position, m.position);
    //magnitude of force
    float distance = force.mag();
    distance = constrain(distance,5.0,25.0);
    float magnitude = ((G * mass * m.mass) / (distance*distance));
    force.normalize();
    force.mult(magnitude);
    force.mult(-1);
    return force;
  }
  
   PVector attract(Attractor a) {
    //direction of force
    PVector force = PVector.sub(position, a.position);
    //magnitude of force
    float distance = force.mag();
    distance = constrain(distance,5.0,25.0);
    force.normalize();
    float magnitude = ((G * mass * a.mass) / (distance*distance));
    force.mult(magnitude);
    return force;
  }
  
   void checkEdges() {

    if (position.x > width) {
      velocity.x *= -1;
      position.x = width;
    } 
    
    else if (position.x < 0) {
      velocity.x *= -1;
      position.x = 0;
    }
    
    if (position.y > height) {
      velocity.y *= -1;
      position.y = height;
    } 
    
    else if (position.y < 0) {
      velocity.y *= -1;
      position.y = 0;
    }
    
  }
 
}
