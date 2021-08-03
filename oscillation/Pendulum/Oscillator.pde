class Oscillator {
  PVector angle;
  PVector aVel;
  PVector amplitude;
  PVector position;
  PVector aAccel;
  int c;
  
  Oscillator(PVector aVel, PVector amplitude) {
    angle = new PVector(0,0);
    //aVel = new PVector(random(-0.1,0.1),random(-0.1,0.1));
    //amplitude = new PVector(random(width-50),random(height-50));
    this.aVel = aVel;
    this.amplitude = amplitude;
    position =  new PVector(0,0);
    aAccel = new PVector(0.001,0.001);
  }
  
  void update(){
    angle.add(aVel);
    aVel.add(aAccel);
    aVel.x = constrain(aVel.x,-0.5,0.5);
    aVel.y = constrain(aVel.y,-0.5,0.5);
    
    position.x = cos(angle.x)*amplitude.x;
    position.y = sin(angle.y)*amplitude.y;
    
    c = int(map(position.x, -amplitude.x, amplitude.x, 0, 255));
    
    position.x = map(position.x,-amplitude.x,amplitude.x,-width/2+20,width/2-20);
    position.y = map(position.y,-amplitude.y,amplitude.y,20,height-20);
   
  }
  
  void display() {    
    pushMatrix();
    ellipseMode(CENTER);
    stroke(0);
    fill(c);
    //println(c);
    translate(width/2,0);
    line(0,0,position.x,position.y);
    ellipse(position.x,position.y,20,20);
    popMatrix();
    
  }
}
