Mover[] movers = new Mover[1];
float tx,ty;

void setup() {
  size(640,360);
  background(255);
  for (int i =0; i<movers.length;i++) {
    movers[i] = new Mover(random(0.3,3),0,0);
  }
}

void draw() {
  //background(255);
  for (int i =0; i<movers.length;i++) {
    
    //add wind
    PVector wind = new PVector(0.01,0);    
    //add gravity
    PVector gravity = new PVector(0,0.1*movers[i].mass);
  
    //friction pockets
    movers[i].checkPockets(10,100,10,100,1);
    noFill();
    square(10, 10, 90);
    
    //int a = int(random(0,width));
    //int b = int(random(0,height));
    int a = 200;
    int b = 150;
    movers[i].checkPockets(a,a+150,b,b+150,1);
    noFill();
    square(a, b, 150);
    
    movers[i].applyForce(wind);
    movers[i].applyForce(gravity);
    
    movers[i].checkEdges();
    movers[i].update();
    movers[i].display();
  }
}
