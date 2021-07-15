//game where particles repel each other and are attracted by the mouse
//colors change based on position in the screen

Mover[] movers = new Mover[20];
Attractor attractor;

void setup() {
  size(800,600);
  //background(255);
  for (int i =0; i<movers.length;i++) {
    movers[i] = new Mover(random(0.5,30),random(width),random(height));
  }
}

void draw() {
  background(255,229,204);
  //stroke(0,100);
  for (int i =0; i<movers.length;i++) {
    //attraction forces
    for (int j =0; j<movers.length;j++) {
      if (i!=j) {
        //repel each other
        PVector f_repel = movers[j].repel(movers[i]);
        movers[i].applyForce(f_repel);
        //attract mouse
        attractor = new Attractor();
        PVector f_attract = movers[i].attract(attractor);
        movers[i].applyForce(f_attract);
        
        movers[i].checkEdges();
        movers[i].update();
        
        //beginShape(POINTS);
        //vertex(movers[i].position.x,movers[i].position.y);
        //endShape();
       
        movers[i].display();
        attractor.display();
        println(attractor.position);
      }
    }
  }
}
