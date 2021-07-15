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
  
  //void display() {
  //  noStroke();
  //  fill(0,10);
  //  ellipse(position.x, position.y, 30*mass, 30*mass);
    
  //}
  
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
