/*
The Nature Of Code - Introduction: 2D Noise
*/

//third argument of noise --> provides the animation
float z = 0;

Painting p;

void setup() {
  size(640,360);
  p = new Painting();
  //noLoop();
  //frameRate(500);
}

void draw() {
  background(0);
  p.paint();
}

class Painting {
  //noiseDetail(lod, fallof)
  //lod: smooth --> fine-grained
  //fallof: black --> white 
  Painting() {
    // Optional: adjust noise detail here
    float detail = 0.0;
    int lod = (int) map(noise(detail),0,1,0,15);
    noiseDetail(lod,0.65f);
  }
  
  void paint() {
    background(0);
    loadPixels();
    float xoff = 0.0;
    for (int x = 0; x < width; x++) {
      float yoff = 0.0;
      for (int y = 0; y < height; y++) {
             
        //noise(x,y,z) -> different effect based on how many parameters
          //only x; then the same color applies to every column
          //only y: then the same color applies to every row
          //x, y: static 2D noise
          //x, y, z: animated 2D noise
          
        float bright = noise(xoff,yoff,z)*255;
        
        //comparison to complete randonmess
        //float bright = random(0,255);
        
        pixels[x+y*width] = color(bright);
        yoff += 0.01;
        z+=0.0000001;
      }
      xoff += 0.01;
      z+=0.00001;
      
    }
    z+=0.01;
    
    updatePixels();
  }
}
