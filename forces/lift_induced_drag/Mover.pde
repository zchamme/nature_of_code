class Mover {
  
  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass;
  float w,h;
  
  Mover(float m, float x, float y, float w_, float h_) {
    position = new PVector(x,y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0.01,0.01);
    mass = m;
    w = w_;
    h = h_;
    
  }
  
  void update() { 
     velocity.add(acceleration);
     position.add(velocity);
     acceleration.mult(0);
    
  }
  
  void display() {
    stroke(0);
    fill(175);
    //ellipse(position.x, position.y, 30*mass, 30*mass);
    rect(position.x, position.y,w,h);
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
  
  boolean isInside(Liquid l) {
    if(position.x > l.x && position.x < l.x+l.w && position.y > l.y && position.y < l.y+l.h) {
      return true;
    }
    else {
      return false;
    }
  }
    
   void drag (Liquid l) {
    //add air/fluid resistance by calculating drag force
    float speed = velocity.mag();
    //added surface area
    float dragMagnitude = l.c * speed * speed * w*0.01;
    PVector drag = velocity.copy();
    drag.mult(-1);
    drag.normalize();
    drag.mult(dragMagnitude);
    applyForce(drag);
   }
    
  }
  
  
