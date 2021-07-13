class Mover {
  
  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass;
  float tx,ty;
  
  Mover() {
    position = new PVector(0,0);
    velocity = new PVector(0,0);
    acceleration = new PVector(0.01,0.01);
    mass = 0.5;
  }
  
  void update() {
    
    if(mousePressed) {
      float xwind = noise(tx);
      float ywind = noise(ty);
      
      xwind = map(xwind,0,1,-2,2);
      xwind = map(ywind,0,1,-2,2);
      
      PVector wind = new PVector(xwind,ywind);
      
      tx += 0.01;
      ty += 0.01;
      
      mover.applyForce(wind);
    }
    
     velocity.add(acceleration);
     position.add(velocity);
     acceleration.mult(0);
    
  }
  
  void display() {
    imageMode(CENTER);
    image(balloon,position.x, position.y,80*mass, 80*mass);
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
