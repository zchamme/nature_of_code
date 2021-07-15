Mover[] movers = new Mover[100];
Attractor[] attractors = new Attractor[5];

void setup() {
  size(800,600);
  background(255);
  for (int i =0; i<attractors.length;i++) {
    attractors[i] = new Attractor();
    println("attractor["+i+"] = new Attractor("+attractors[i].position); // so you *can* get your favourite one back, if you want!
  }
  for (int i =0; i<movers.length;i++) {
    movers[i] = new Mover(random(0.5,10),random(0,width),random(0,height));
  }
}

void draw() {
  //background(255);
  stroke(0,15);
  for (int i =0; i<movers.length;i++) {
    //attraction forces
    for (int j =0; j<attractors.length;j++) {
      PVector f = attractors[j].attract(movers[i]);
      movers[i].applyForce(f);
      
      movers[i].update();
      
      beginShape(POINTS);
      vertex(movers[i].position.x,movers[i].position.y);
      endShape();
      //movers[i].display();
      //attractors[j].display();
    }
  }
}
