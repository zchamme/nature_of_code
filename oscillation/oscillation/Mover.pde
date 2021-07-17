class Mover {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass;
  float G;
  
  float angle = 0;
  float aVel = 0;
  float aAccel = 0.08;
  
  Mover(float m, float x, float y) {
    position = new PVector(x,y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0.4,0.4);
    mass = m;
    G = 0.01;
  }
  
  void update(){
    velocity.add(acceleration);
    position.add(velocity);
    
    aVel += aAccel;
    angle += aVel;
    
    acceleration.mult(0);
  }
  
  void display() {
    if (frameCount % 10 == 0) {
      //background(255,229,204);
      fill(frameCount * 3 % 255, frameCount * 5 % 255,
        frameCount * 7 % 255);
    }
    //fill(175,200);
    stroke(0);
    rectMode(CENTER);
    
    pushMatrix();
    translate(position.x+100,position.y+100);
    rotate(angle);
    ellipse(position.x,position.y,mass*10,mass*10);
    ellipse(position.x+30,position.y+30,mass*10,mass*10);
    line(position.x,position.y,position.x+30,position.y+30);
    //rect(0,0,mass*10,mass*10);
    popMatrix();
    
    aAccel = acceleration.x/100;
    aVel += aAccel;
    angle += aVel;
    aVel = constrain(aVel,-0.1,0.1);
  }
}
