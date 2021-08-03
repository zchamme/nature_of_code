float period, amplitude, x;
int c;

void setup (){
  size(600,400);
}

void draw(){
  period = 200;
  amplitude = 100;
  x = amplitude*cos(TWO_PI*frameCount/period);
  c = int(map(x, -100, 100, 0, 255));

  //background(c*2 % 255,c*7 % 255,c*11%255);
  background(0,c,255);
  if (x < 0.01 && x > -0.01) {
    println(c);
  }
  //if (key == ' '){
  //  int f = frameCount;
  //  println(f);
  //}
  //background(255);
  stroke(0);
  fill(c);
  translate(width/2,height/2);
  line(0,0,x,0);
  ellipse(x,0,20,20);
  
}
