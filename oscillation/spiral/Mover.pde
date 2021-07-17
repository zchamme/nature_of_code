class Mover {
  float r;
  float theta;
  float spiral_width;
  PVector offset;
  float x,y;
  int c;
  float angle_increment, spWidth_increment;
  
  Mover() {
    theta = 0;
    r = 10;
    spiral_width = 0.1;
    c = 255;
    angle_increment = 0.1;
    spWidth_increment = 1;
  }
  
  void update(){
    offset = new PVector (cos(theta),sin(theta)).normalize();
    x = r * cos(theta) + offset.x*spiral_width;
    y = r * sin(theta) + offset.y*spiral_width;
  }
  
  void display(){
    
    stroke(200,5);
    fill(c,50);
    pushMatrix();
    translate(width/2,height/2);
    rotate(theta);
    ellipse(x,y,16,16);
    //line(0,0,x,y);
    popMatrix();
    
    theta+=angle_increment;
    spiral_width+=spWidth_increment;
  }
  
  void reset() {
    angle_increment = 0.1;
    spWidth_increment = 1;  
  }
  

}
