class Object {
  PVector position;
  PVector velocity;
  float mass;
  float x,y;
  PImage image;
  
  Object(float x, float y, String im) {
    position = new PVector(x,y);
    velocity = new PVector(1,1);
    mass = 10;
    image = loadImage(im);
  }
  
  void update() {
    position.add(velocity);
  }
  
  void display() {
    imageMode(CENTER);
    image(image,position.x, position.y,100, 100);
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
