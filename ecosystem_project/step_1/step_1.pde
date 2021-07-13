PImage libelula;
Creature creature;

void setup() {
  size(640,360);
  libelula = loadImage("libelula.jpg");
  creature = new Creature();
}

void draw() {
  background(255);
  //imageMode(CENTER);
  //image(libelula,320,180);
  creature.update();
  creature.checkEdges();
  creature.display(); 
}
