PImage libelula;
Creature creature;
Object floating_nenufar, hand_moving;

void setup() {
  size(800,600);
  libelula = loadImage("libelula.jpg");
  creature = new Creature();
  floating_nenufar = new Object(10,10,"nenufar.jpg");
  hand_moving = new Object(width,height,"hand.jpg");
}

void draw() {
  background(236,255,255);

  PVector f = creature.attract(floating_nenufar.position, floating_nenufar.mass);
  creature.applyForce(f);
  f = creature.attract(hand_moving.position, hand_moving.mass);
  creature.applyForce(f.mult(-1));
  
  creature.checkEdges();
  creature.update();
  creature.display(); 
  
  floating_nenufar.update();
  floating_nenufar.checkEdges();
  floating_nenufar.display();
  
  hand_moving.update();
  hand_moving.checkEdges();
  hand_moving.display();
  
}
