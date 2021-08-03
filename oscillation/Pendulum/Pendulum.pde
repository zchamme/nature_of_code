
Oscillator[] pendulum;

void setup (){
  size(600,400);
  pendulum = new Oscillator[3];
  PVector aVel = new PVector(0.01,0.01);
  PVector aVel_ = aVel.copy();
  PVector amplitude = new PVector(80.0,80.0);
  PVector amplitude_ = amplitude.copy();
  
  //double-check this part, initialization is not quite right
  for (int i=0; i < pendulum.length;i++){
    pendulum[i] = new Oscillator(aVel.add(new PVector (i*0.02,i*0.02)), 
    amplitude.add(new PVector(i*width/10,i*height/10)));
    //println(i*0.1);
    println("aVel: ", aVel);
    println("amplitude: ",amplitude);
    //reset vectors
    aVel = aVel_;
    amplitude = amplitude_;
  }
}

void draw(){
  background(255);
  for (int i=0; i < pendulum.length;i++){
    //println("pend#" +i+ ": " + pendulum[i].aVel + "(vel) // " + pendulum[i].amplitude + "(amplitude)" );
    pendulum[i].update();
    pendulum[i].display();
  }
  
}
  
