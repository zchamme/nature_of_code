class Wave {

  float angle = 0;
  float angleVel = 0.2;
  float amplitude = 100;
  float startAngle = 0;
  int wave_no;
  
  Wave (){
    
  }
  
  Wave (float amplitude, float period, int wave_no) {
    this.amplitude = amplitude;
    angleVel = period;
    this.wave_no = wave_no;
  }
  
  //calc and draw wave
  void update() {
    beginShape();
    for (int x=0; x<width ; x+=5) {
      float y = map(noise(angle),0,1,0,amplitude);
      vertex(x,y+wave_no*100);
      angle += angleVel;
    }
    endShape();
  
  }
  
  //perlin noise wave
  void add_perlin(Wave w1) {
    beginShape();
    for (int x=0; x<width ; x+=5) {
      float y = map(noise(angle),0,1,0,amplitude);
      float y1 = map(noise(w1.angle),0,1,0,w1.amplitude);
      vertex(x,y+y1);
      w1.angle += w1.angleVel;
      angle += angleVel;
    }
    endShape();
  }
  
  //sin wave
  void add_harmonic(Wave w1) {
    beginShape();
    for (int x=0; x<width ; x+=5) {
      float y = map(sin(angle),-1,1,0,amplitude);
      float y1 = map(sin(w1.angle),-1,1,0,w1.amplitude);
      vertex(x,y+y1+height/3);
      w1.angle += w1.angleVel;
      angle += angleVel;
    }
    endShape();
  }
  
  //void display() {
  //  beginShape();
  //  for (int x=0; x<width ; x+=5) {
  //    float y = map(noise(angle),0,1,0,amplitude);
  //    vertex(x,y+wave_no*100);
  //  }
  //  endShape();
  
}
