class Wave {
  
  float amplitude, period, phase;
 
  Wave (float amplitude, float period, float phase) {
    this.amplitude = amplitude;
    this.period = period;
    this.phase = phase;
  }
  
  //calc and draw wave
  float calc(float x) {
    //given any x, calculate the y for any wave
    float y = sin(this.phase + TWO_PI*x/this.period)*this.amplitude; //function of a wave
    return y;
  }
  
  void update() {
    this.phase += 0.1;
  }
}
