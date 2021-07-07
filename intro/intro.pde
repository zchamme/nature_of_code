import java.util.Random;

Random generator;

float gaussian(int mean, int sd) {
  float num = (float) generator.nextGaussian();
  float val = sd * num + mean;
  return val;
}

class Walker {
  int x;
  int y;
  int red;
  int green;
  int blue;
  
  //constructor to initialize object
  Walker() {
    x = width/2;
    y = height/2;
  }
  
  void step() {
    //float stepx = gaussian(0,1);
    //float stepy = gaussian(0,1);
    float stepx, stepy;
    
    float r = random(1);
    if (r < 0.01) {
      stepx = random(-100,100);
      stepy = random(-100,100);
    }
    else {
      stepx = random(-1,1);
      stepy = random(-1,1);
    }

    x += stepx;
    y += stepy;
    
    // Stay on the screen
    x = constrain(x, 0, width-1);
    y = constrain(y, 0, height-1);
   
  }
  
  void setColors () {
    red = (int) gaussian(125,60);
    blue = (int) gaussian(125,60);
    green = (int) gaussian(125,60);
  }
  
  void display () {
    strokeWeight(0.5);
    stroke(0);
    fill(red, green, blue,40);
    ellipse(x,y,10,10);
    point(x,y);
    println();
    System.out.println("x " +  x);
    System.out.println("y "+ y);
    println();
   
  
  }
}

Walker w;

void setup() {
  size(640,360);
  frameRate(30);
  background(255);
  generator = new Random();
  w = new Walker();

}

void draw() {
  w.step();
  w.setColors();
  w.display();
  
}
