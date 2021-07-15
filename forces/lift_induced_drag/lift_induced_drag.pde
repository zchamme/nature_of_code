//solution: https://www.bountysource.com/issues/2059222-exercise-2-7-solution

Mover[] movers = new Mover[5];
Liquid liquid;

void setup() {
  size(640,360);
  //background(255);
  float dragCoef = 0.1;
  liquid = new Liquid(0,height/2,width,height/2,dragCoef);
  for (int i =0; i<movers.length;i++) {
    movers[i] = new Mover(random(0.1,5),random(0,width),0,random(5,100),random(5,100));
  }
}

void draw() {
  background(255);
  liquid.display();
  
  for (int i =0; i<movers.length;i++) {
    
    if (movers[i].isInside(liquid)) {
      movers[i].drag(liquid);
    }
    //add wind
    PVector wind = new PVector(0.05,0);    
    //add gravity
    PVector gravity = new PVector(0,0.1*movers[i].mass);

    movers[i].applyForce(wind);
    movers[i].applyForce(gravity);
    movers[i].checkEdges();
    movers[i].update();
    movers[i].display();
  }
}
