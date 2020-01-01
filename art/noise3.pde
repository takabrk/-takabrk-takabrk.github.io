void setup() {
  size(window.innerWidth, 300); 
  smooth(); 
  background(255);
  float xstart = random(10); 
  float xnoise = xstart; 
  float ynoise = random(10);
  for (int y = 0; y <= height; y+=4) {
    ynoise += 0.03;
    xnoise = xstart;


    for (int x = 0; x <= width; x+=5) {
      xnoise += 0.02;
      float alph = ynoise;
      stroke(0, 50, 50, alph*1);
      drawPoint(x, y, noise(xnoise, ynoise));
    }
  }
}
void drawPoint(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x, y);
  rotate(noiseFactor * radians(360));

  line(0, 0, 750, 0);
  popMatrix();
}

