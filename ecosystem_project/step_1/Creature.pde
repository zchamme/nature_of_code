class Creature {
  
  PVector position;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  
  Creature() {
    position = new PVector(0,0);
    velocity = new PVector(0,0);
    acceleration = new PVector(0.01,0.01);
    topspeed = 10;
      
  }
  
  void update() {
    PVector mouse = new PVector(mouseX,mouseY);
    
    PVector dir = PVector.sub(mouse, position);
    
    dir.normalize();
    dir.mult(0.3);
    
    acceleration = dir;
    
    position.add(velocity);
    velocity.add(acceleration);
    velocity.limit(topspeed);
  }
  
  void display() {
    imageMode(CENTER);
    image(libelula,position.x, position.y,80, 80);
  }
  
  void checkEdges() {

    if (position.x > width || position.x < 0) {
      velocity.x = -velocity.x;
    } 
    else if (position.y > height || position.y < 0) {
      velocity.y = -velocity.y;
    }
  } 
}
