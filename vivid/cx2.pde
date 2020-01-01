class CX2{
  float[] squareX,squareY;
  int wNum,hNum,array;
  float angle,rSize,a;
  int Length = 20;
  float[] X = new float[Length],Y = new float[Length],Ang = new float[Length],Rot = new float[Length],c = new float[Length],Radius = new float[Length]; 
  float cx,cy,power = 0,MaxPower = 200;
  float fluc_color;
  float fluc_y;
  PGraphics pg;
  CX2(){
  }
  void card_shuffle(){
  beginDraw();
  stroke(0);
  strokeWeight(1);
  frameRate(24);
  colorMode(RGB,256);
  angle += 0.01f;
  for(int i=0;i<256;i++){
      translate(width/2,height/2);
      rotate(sin(angle)*cos(angle)*tan(angle));
      rect(i/cos(angle),-i*sin(angle),width/3,height/3);
      rectMode(CENTER);
      fill(0,255-random(100),255-random(100));
    }
  }
  void RBW(){
    beginDraw();
    stroke(0);
    strokeWeight(1);
    angle += 0.00003f;
    for(int i=0;i<256;i++){
      rotate(cos(angle)*cos(angle)+sin(angle)+tan(angle)/2);
      translate(width/2,height/2);
      fill(i,256-i,0);
    beginShape();
    vertex( -20,  i );
    vertex(  20,  i );
    vertex(  20,  20 );
    vertex(  i,  20 );
    vertex(  i, -20 );
    vertex(  20, -20 );
    vertex(  20, -i );
    vertex( -20, -i );
    vertex( -20, -20 );
    vertex( -i, -20 );
    vertex( -i,  20 );
    vertex( -20,  20 );  
    endShape(CLOSE);
    fill(0,0,i);
    ellipse(width/2,-i,50,50);
    ellipseMode(CENTER);
    fill(i,i,i);
    ellipse(width/1.3f,i,10,10);
    ellipseMode(CENTER);
    }
    endDraw();
  }
  void worp_man(){
    beginDraw();
    frameRate(15);
    for(int k=0;k<5;k++){
      stroke(random(255),random(255),random(255));
      ellipse(width/2,height/2,random(1000),random(1000));
      fill(random(255),0,0,30); 
    }
    endDraw();
  }
  void prism(){
    beginDraw();
    stroke(255);
    for(int i=0;i<5;i++){
      stroke(255-random(100),255-random(100),255-random(100));
      line(width/2,0,random(1000),random(1000));
      rotate(radians(360));
    }
  }
  void snow_circle(){
    beginDraw();
    angle += 0.01f;
    for(int i=0;i<256;i++){
      translate(width/2,height/2);
      rotate(sqrt(2)*sin(angle));
      ellipse(i,i,10,10);
      fill(256,256,256);
    }
    endDraw();
  }
    void crimson_world(){
    beginDraw();
    stroke(255,0,0);
    colorMode(RGB);
    frameRate(10);
    noFill();
    for(int i = 0;i<30;i++){
      ellipse(random(width/2),random(height/2),random(width/2)+300,random(height/2)+300);
      rotateX(radians(i*15));
      rotateY(radians(i*5));
    }
    endDraw();
  }

  void spider_ball(){
    beginDraw();
    frameRate(24);
    stroke(0);
    strokeWeight(1);
    angle += 0.01f;
    for(int i = 0;i<256;i++){
      translate(i,i);
      rotate(cos(angle)*cos(angle));
      ellipse(i,i,100,100);
      fill(i,0,256-i);
    }
  }
  void randomLine(){
    colorMode(HSB,100);
    for(int i=0;i<1000;i++){
      stroke(random(256),random(256),random(256),30);
      line(random(width),random(3*width),random(height),height);
    }
  }
  void curveEffect(){
    for(int i=0;i<256;i++){
      stroke(0,0,i);
      strokeWeight(4);
      curve(i,0,i+160,60,40,i+120,160,200);
      curve(0,0,width-i,height-i*2,i*12,i*i,i*i,width/2);
      curve(width,height,0,0,sin(45)*i+width,cos(60)*i+height,width,0);
      curve(width/2,height/2,width*sin(60),height*cos(45)*cos(30),0,0,width,height);
    }
  }
  void sea(){
    fluc_color = 0;
    for(int j=0;j<=height;j+=5){
      fluc_color += random(-50,50);
      stroke(fluc_color,60,100,30);
      fluc_y = 0;
      beginShape();
      for(int i=0;i<=width;i+=5){
        fluc_y += random(-2,2);
        vertex(i,j+fluc_y);
      }
      endShape();
    }
  }
  void check(){
    colorMode(RGB,10);
    noStroke();
    fill(0,0,0,5);
    for(int i=0;i<5;i++){
      rect(0,10+i*40,width,20);
      rect(10+i*40,0,20,height);
    }
    fill(10,10,10,3);
    for(int i=0;i<5;i++){
      rect(0,10+i*40+3,width,2);
      rect(0,10+i*40+15,width,2);
      rect(10+i*40+3,0,2,height);
      rect(10+i*40+13,0,2,height);
    }
  }
  void pushText(String fontsrc){
    int MaxColor;
    PFont font;
    MaxColor = 100;
    colorMode(HSB,MaxColor);
    frameRate(10);
    font = loadFont(fontsrc);
    textFont(font);
    textAlign(CENTER);
    if(keyPressed){
      fill(random(MaxColor),MaxColor,MaxColor,80);
      text(key,random(width),random(height));
    }
  }
  void keyPressed(){
    switch(key){
    case ' ':
      background(0);
      break;
    }
  }
}

class RED_3D{
    float offset = PI/12,b = 0.0f,sSize;
    int num = 12,safecolor;
    int[] colors = new int[num];
    boolean pink = true;
    RED_3D(int wi,int hi){
      size(wi,hi);
      sSize = width/5;
      fill(204,204);
      safecolor = color(256,0,0);
      for(int i=0;i<num;i++){
        colors[i] = color(256*(i+1)/num,0*(num-i)/num,0);
      }
      lights();
    }
    void draw(){
      noStroke();
      frameRate(24);
      b += 0.02f;
      if(b>TWO_PI){
        b = 0.0f;
      }
      translate(width/2,height/2);
      rotateX(b/4);
      rotateY(b*2);
      rect(-sSize,-sSize,sSize*2,sSize*2);
      rotateX(b*1.001f);
      rotateY(b*2.002f);
      rect(-sSize,-sSize,sSize*2,sSize*2);
      rotateX(b);
      rotateY(b);
      rect(-sSize,-sSize,-sSize,-sSize);

      translate(0,0,16);
      translate(width/2,height/2,-20);
      if(b>=TWO_PI*2){
        b=0.0f;
      }
      for(int i=0;i<num;i++){
        pushMatrix();
        fill(colors[i]);
        rotateY(b+offset*i);
        rotateX(b/2+offset*i);
        box(width/2);
        popMatrix();
      }
    }
  }

class Bird{
    float offsetX,offsetY,offsetZ;
    float w,h;
    int bodyFill;
    int wingFill;
    float ang = 0,ang2 = 0,ang3 = 0,ang4 = 0;
    float radiusX = 120,radiusY = 200, radiusZ = 700;
    float rotX = 15,rotY = 10,rotZ = 5;
    float flapSpeed = 0.4f;
    float rotSpeed = 0.1f;
    Bird(float offsetX,float offsetY,float offsetZ,float w,float h){
      this.offsetX = offsetX;
      this.offsetY = offsetY;
      this.offsetZ = offsetZ;
      this.w = w;
      this.h = h;
      bodyFill = color(153);
      wingFill = color(204);
    }
    void setFlight(float radiusX,float radiusY,float radiusZ,float rotX,float rotY,float rotZ){
      this.radiusX = radiusX;
      this.radiusY = radiusY;
      this.radiusZ = radiusZ;
      
      this.rotX = rotX;
      this.rotY = rotY;
      this.rotZ = rotZ;
    }
    void setWingSpeed(float flapSpeed){
      this.flapSpeed = flapSpeed;
    }
    void setRotSpeed(float rotSpeed){
      this.rotSpeed = rotSpeed;
    }
    void fly(){
      pushMatrix();
      float px,py,pz;
      px = sin(radians(ang3)) * radiusX;
      py = cos(radians(ang2)) * radiusY;
      pz = sin(radians(ang4)) * radiusZ;
      
      translate(width/2 + offsetX + px,height/2 + offsetY + py,-700 + offsetZ + pz);
      
      rotateX(sin(radians(ang2)) * rotX);
      rotateY(sin(radians(ang2)) * rotY);
      rotateZ(sin(radians(ang2)) * rotZ);
      
      fill(bodyFill);
      box(w/5,h,w/5);
      fill(wingFill);
      pushMatrix();
      rotateY(sin(radians(ang)) * 20);
      rect(0,-h/2,w,h);
      popMatrix();
      
      pushMatrix();
      rotateY(sin(radians(ang)) * -20);
      rect(-w,-h/2,w,h);
      popMatrix();
      
      ang += flapSpeed;
      if(ang>3){
        flapSpeed *= -1;
      }else if(ang<-3){
        flapSpeed *= -1;
      }
      
      ang2 += rotSpeed;
      ang3 += 1.25f;
      ang4 += 0.55f;
      popMatrix();
    }
  }

class Birds{
    int birdCount = 1000;
    Bird[]birds = new Bird[birdCount];
    float[]x = new float[birdCount];
    float[]y = new float[birdCount];
    float[]z = new float[birdCount];
    float[]rx = new float[birdCount];
    float[]ry = new float[birdCount];
    float[]rz = new float[birdCount];
    float[]spd = new float[birdCount];
    float[]rot = new float[birdCount];
    Birds(){
      noStroke();
      for(int i=0;i<birdCount;i++){
        birds[i] = new Bird(random(-300,300),random(-300,300),random(-500,-2500),random(5,30),random(5,30));
        x[i] = random(20,340);
        y[i] = random(30,350);
        z[i] = random(1000,4800);
        rx[i] = random(-160,160);
        ry[i] = random(-55,55);
        rz[i] = random(-20,20);
        spd[i] = random(0.1f,3.75f);
        rot[i] = random(0.025f,.15f);
      }
    }
    public void draw(){
     lights();
      for(int i=0;i<birdCount;i++){
        birds[i].setFlight(x[i],y[i],z[i],rx[i],ry[i],rz[i]);
        birds[i].setWingSpeed(spd[i]);
        birds[i].fly();
      }
    }
  }