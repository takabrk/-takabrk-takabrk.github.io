void setup() {
size(window.innerWidth, 300);
smooth(); 
background(255);
float xstart = random(5); 
float xnoise = xstart; 
float ynoise = random(10);
for (int y = 0; y <= height; y+=5) {
  ynoise += 0.1;
  xnoise = xstart;


  for (int x = 0; x <= width; x+=8) {
    xnoise += 0.5;
    float alph = ynoise;
    stroke(0,0,50, alph*5);
    drawPoint(x, y, noise(xnoise, ynoise));
  }
}
}
void drawPoint(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x, y);
  rotate(noiseFactor * radians(180));

  line(0,0,50,0);
  popMatrix();
  
}
