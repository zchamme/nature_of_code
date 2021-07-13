PImage balloon;
Mover[] movers = new Mover[5];
float tx,ty;

void setup() {
  size(640,360);
  balloon = loadImage("balloon.jpg");
  for (int i =0; i<movers.length;i++) {
    movers[i] = new Mover(random(0.3,3),0,0);
  }
}

void draw() {
  background(255);
  for (int i =0; i<movers.length;i++) {
    
    if(mousePressed) {
      float xwind = noise(tx);
      float ywind = noise(ty);
      
      xwind = map(xwind,0,1,-2,2);
      xwind = map(ywind,0,1,-2,2);
      
      //float xgrav = map(xwind,0,1,0,5);
      //float ygrav = map(ywind,0,1,0,5);
      
      PVector wind = new PVector(xwind,ywind);
      
      tx += 0.01;
      ty += 0.01;
       
      movers[i].applyForce(wind);
      
    }
    
    float scale = 0.002;
        
    PVector offWall = new PVector(abs(width - movers[i].position.x) * scale - 
    (movers[i].position.x * scale),abs(height - movers[i].position.y) * scale-(movers[i].position.y * scale));
    println(offWall);
    
    PVector gravity = new PVector(0,0.1*movers[i].mass);

    movers[i].applyForce(offWall);

    movers[i].applyForce(gravity);
    //movers[i].checkEdges();
    movers[i].update();
    movers[i].display(); 
  }
}
