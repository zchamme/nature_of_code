// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Mover {

  PVector position;
  PVector velocity;
  PVector acceleration;
  
  float topspeed,tx,ty,nx,ny,accX,accY;

  Mover() {
    position = new PVector(width/2, height/2);
    velocity = new PVector(0,0);
    acceleration = new PVector();
    topspeed = 15;
    tx = 0;
    ty = 1000;
    
    //nx = noise(tx);
    //ny = noise(ty);
    
    //accX = map(nx,0,1,-0.1,0.1);
    //accY = map(ny,0,1,-0.1,0.1);
    
    //acceleration = new PVector(accX,accY);
  }

  void update() {
    position.add(velocity);
    velocity.add(acceleration);
    velocity.limit(topspeed);
    
  }
  
  void perlinAcc () {
    nx = noise(tx);
    ny = noise(ty);
    
    accX = map(nx,0,1,-0.1,0.1);
    accY = map(ny,0,1,-0.1,0.1);
    
    print(accX + "  " + accY);
    println();
    acceleration = new PVector(accX,accY);
    
    tx+=0.1;
    ty+=0.1;
  }
  
  
  //void mousePressed() {
  //  acceleration = new PVector();
  //  velocity = new PVector();
  //}
  
  //void mouseReleased() {
  //  //mover.acceleration = new PVector(-0.001,0.01);
  //  acceleration = PVector.random2D();
  //  acceleration.mult(random(2));
  //  velocity = new PVector();  
  //}
    
  void display() {
    stroke(0);
    strokeWeight(2);
    fill(127);
    ellipse(position.x, position.y, 48, 48);
  }

  
  void changeDir() {
    if ((position.x > width) || (position.x < 0)) {
      velocity.x = velocity.x * -1;
    }
  
    if ((position.y > height) || (position.y < 0)) {
      velocity.y = velocity.y * -1;
    }
  }
  
  void checkEdges() {

    if (position.x > width) {
      position.x = 0;
    } 
    else if (position.x < 0) {
      position.x = width;
    }

    if (position.y > height) {
      position.y = 0;
    } 
    else if (position.y < 0) {
      position.y = height;
    }
  }
}

//void limit(float max) {
//  if (mag() > max) {
//    normalize();
//    mult(max);
//  }}
    

//Ex 1.9: Car that accelerates when pressing the key and brakes when off
