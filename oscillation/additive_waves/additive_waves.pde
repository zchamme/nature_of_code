Wave[] waves = new Wave[10];

void setup() {
  size(600,400);
  //background(255);
  
  noStroke();
  //strokeWeight(2);
  //noFill();
  
  for (int i=0; i<waves.length; i++){
    waves[i] = new Wave(random(20,80),random(100,300),random(TWO_PI));
  }
  
}

void draw() {
  background(100,100,200);
  
  //first batch
  beginShape();
  for (int x=0; x<width; x+=10) {
    float y = 0;
    for (int i=0; i<waves.length/2; i++){
      y += waves[i].calc(x);
    }
    fill(map(x,0,50,0,255),map(y,0,50,0,255),255);
    vertex(x,y+height/2);
    //ellipse(x,y+height/2,10,10);
  }
  endShape();
  
  //second batch
  beginShape();
  for (int x=0; x<width; x+=10) {
    float y = 0;
    for (int i=waves.length/2; i<waves.length; i++){
      y += waves[i].calc(x);
    }
    fill(map(x,0,50,0,255),255,map(y,0,50,0,255));
    println(x,y);
    vertex(x,y+height/2);
    //ellipse(x,y+height/2,10,10);
  }
  endShape();
  
  //picture the wave in motion
  for (int i=0; i<waves.length; i++){
      waves[i].update();
   }
  
}
