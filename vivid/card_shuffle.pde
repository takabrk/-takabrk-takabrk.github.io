CX2 cx;
RED_3D red;
Birds bi;
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
  //red = new RED_3D(1280,720);
  //bi = new Birds();
}

void draw(){
  background(0);
  cx.card_shuffle();
  //cx.RBW();
  //cx.worp_man();
  //cx.prism();
  //cx.snow_circle();
  //cx.spider_ball();
  //cx.crimson_world();
  //cx.sea();
   //bi.draw();
   //red.draw();
}
