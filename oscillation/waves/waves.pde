Wave wave_1, wave_2, wave_3;

void setup() {
  size(600,400);
  background(255);
  
  stroke(255);
  strokeWeight(2);
  noFill();
  
  wave_1 = new Wave(100,0.05,1);
  wave_2 = new Wave(50,0.1,2);

}

void draw() {
  background(25,10,20);
  
  //wave_1.update();
  //wave_2.update();
  
  //wave_1.add_perlin(wave_2);
  wave_1.add_harmonic(wave_2); //how to make the display slower?
  
  //makes the wave static
  //angle = startAngle;
  //amplitude = map(amplitude,0,100,0,height);
  
  
}
