class Mover {
  
  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass;
  
  Mover(float m, float x, float y) {
    position = new PVector(x,y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0.01,0.01);
    mass = m;
  }
  
  void update() { 
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
    
    //calculate distances to four walls
    //max-min mormalization of modulus
    //combine forces to get resulting force
    
   // PVector offWall = new PVector((position.x - width)/width - position.x/width, 
   //(position.y - height)/height - position.y/height);
    

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
