// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// 1.2 Bouncing ball with vectors


// Example 1-1: Bouncing Ball, no vectors
//float x = 100;
//float y = 100;
//float xspeed = 3.5;
//float yspeed = 5;

PVector location = new PVector(10,10,10);
PVector velocity =  new PVector(1,3.3,2);

void setup() {
  size(800, 200, P3D);
  smooth();
}

void draw() {
  background(255);


  // Add the current speed to the position.
  //x = x + xspeed;
  //y = y + yspeed;
  
  location.add(velocity);
  
  //check edges
  if ((location.x > width) || (location.x < 0)) {
    velocity.x = velocity.x * -1;
  }
  
  if ((location.y > height) || (location.y < 0)) {
    velocity.y = velocity.y * -1;
  }
  
  if ((location.z > 80) || (location.z < 0)) {
    velocity.z = velocity.z * -1;
  }
  
  //paint box
  pushMatrix();
  translate(width/2, height/2, 0); 
  rotateY(0.5);
  noFill();
  box(80);
  popMatrix();
  
  // Display circle at x position
  //noStroke();
  lights();
  fill(127);
  //scale(location.x/10,location.y/10,location.z/10);
  translate(location.x, location.y, location.z);
  sphere(10);


  //to check if point within the box, first get the ed
  
}

//void checkEdges() {

//}
