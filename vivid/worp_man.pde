CX2 cx;
PFont font;

void setup(){
  size(1280,720);
  colorMode(RGB,256);
  frameRate(30);
  noCursor();
  rectMode(CENTER);
  font = createFont("FFScala",24);
  textFont(font);
  cx = new CX2();
}

void draw(){
  background(0);
  cx.worp_man();
}
