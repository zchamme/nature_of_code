class Creature {
  
  PVector position;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  float damp;
  float G, mass;
  
  Creature() {
    position = new PVector(0,0);
    acceleration = new PVector(0,0);
    velocity = new PVector(0,0);
    topspeed = 20;   
    damp = 0.95;
    G = 4;
    mass = 10;
  }
  
  void update() {
    //PVector mouse = new PVector(mouseX,mouseY);
    //PVector dir = PVector.sub(mouse, position);
    //float scaleFactor = 0.02;
    //float d2 = sq(dir.mag())*scaleFactor;
    
    //println(d2);
    //if (d2 >0.01){
    //  dir.div(d2);
    //}
    
    ////dir.normalize();
    ////dir.mult(0.3);

    //acceleration = dir;
    velocity.add(acceleration);
    position.add(velocity);

    //scale for next frame
    //velocity.mult(damp);
    velocity.limit(topspeed);

  }
  
  void display() {
    imageMode(CENTER);
    image(libelula,position.x, position.y,80, 80);
  }
  
  PVector attract(PVector pos_attractor, float mass_attractor) {
    //direction of force
    PVector force = PVector.sub(position, pos_attractor);
    //magnitude of force
    float distance = force.mag();
    distance = constrain(distance,5.0,25.0);
    force.normalize();
    float magnitude = ((G * mass * mass_attractor) / (distance*distance));
    force.mult(magnitude);
    return force;
  }
  
  void applyForce(PVector force) {
    //make copy of original force vector
    PVector f = force.copy();
    //Newton's second law: F = MxA
    f.div(mass);
    acceleration.add(f);
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
