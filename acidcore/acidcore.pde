Monster pixie1,pixie2,lizardman,valkyrie;
Monster arc_angel_a,arc_angel_b,woman_a,woman_b,woman_c;
Monster lilim,lilith,ibitsureimu,kyuubi,kali;
Monster witch,pflower,nyarlathotep,joker,chimera,ganesha;
Monster asmodeus,succubus,pixie3,pixie4,pixie5;
Monster minotauros,yukari,wyvern,dragon,atena,alice,lucifer,yamatanoorochi;
Ship ship;
PFont font;
PImage title,bg1,bg2,bg3,bg4,bg5,bg6,bg7,bg8,bg9,bg10,bg11,bg12,bg13,bg14,fe;
boolean gameover,enemydestroy;
int stage,score;
float ft;
stageView st;
CX2 cx;
RED_3D r3d;
Birds bi;
String[] mt;
boolean keyState[];
//
void setup() {
  stage = score = 0;
  gameover = false;
  size(800,600);
  colorMode(RGB,256);
  frameRate(30);
  noCursor();        // clear mouse cursor
  rectMode(CENTER); // center mode
  font = createFont("FFScala", 24);
  textFont(font);
    String ml[] = loadStrings("monster.txt");
    String[] mt1 = split(ml[0],' ');
    String[] mt2 = split(ml[1],' ');
    String[] mt3 = split(ml[2],' ');
    String[] mt4 = split(ml[3],' ');
    String[] mt5 = split(ml[4],' ');
    String[] mt6 = split(ml[5],' ');
    String[] mt7 = split(ml[6],' ');
    String[] mt8 = split(ml[7],' ');
    String[] mt9 = split(ml[8],' ');
    String[] mt10 = split(ml[9],' ');
    String[] mt11 = split(ml[10],' ');
    String[] mt12 = split(ml[11],' ');
    String[] mt13 = split(ml[12],' ');
    String[] mt14 = split(ml[13],' ');
    String[] mt15 = split(ml[14],' ');
    String[] mt16 = split(ml[15],' ');
    String[] mt17 = split(ml[16],' ');
    String[] mt18 = split(ml[17],' ');
    String[] mt19 = split(ml[18],' ');
    String[] mt20 = split(ml[19],' ');
    String[] mt21 = split(ml[20],' ');
    String[] mt22 = split(ml[21],' ');
    String[] mt23 = split(ml[22],' ');
    String[] mt24 = split(ml[23],' ');
    String[] mt25 = split(ml[24],' ');
    String[] mt26 = split(ml[25],' ');
    String[] mt27 = split(ml[26],' ');
    //println(mt1);
  
    ship = new Ship();
    pixie1 = new Monster(mt1[0],parseInt(mt1[1]),parseInt(mt1[2]),parseInt(mt1[3]),"typeA",width/3,60,1,1);
    pixie2 = new Monster(mt1[0],parseInt(mt1[1]),parseInt(mt1[2]),parseInt(mt1[3]),"typeA",width/2,100,-1,-1);
    lizardman = new Monster(mt2[0],parseInt(mt2[1]),parseInt(mt2[2]),parseInt(mt2[3]),"typeB",width/2,60,1,1);
    valkyrie = new Monster(mt3[0],parseInt(mt3[1]),parseInt(mt3[2]),parseInt(mt3[3]),"typeC",width/2,60,1,1);
    lilim = new Monster(mt4[0],parseInt(mt4[1]),parseInt(mt4[2]),parseInt(mt4[3]),"typeD",width/2,60,1,1);
    lilith = new Monster(mt5[0],parseInt(mt5[1]),parseInt(mt5[2]),parseInt(mt5[3]),"typeE",width/2,60,1,1);
    ibitsureimu = new Monster(mt6[0],parseInt(mt6[1]),parseInt(mt6[2]),parseInt(mt6[3]),"typeF",width/2,60,1,1);
    kyuubi = new Monster(mt7[0],parseInt(mt7[1]),parseInt(mt7[2]),parseInt(mt7[3]),"typeG",width/2,60,1,1);
    kali = new Monster(mt8[0],parseInt(mt8[1]),parseInt(mt8[2]),parseInt(mt8[3]),"typeH",width/2,60,1,1);
    witch = new Monster(mt9[0],parseInt(mt9[1]),parseInt(mt9[2]),parseInt(mt9[3]),"typeA",width/2,60,1,1);
    pflower = new Monster(mt10[0],parseInt(mt10[1]),parseInt(mt10[2]),parseInt(mt10[3]),"typeC",width/2,60,1,1);
    nyarlathotep = new Monster(mt11[0],parseInt(mt11[1]),parseInt(mt11[2]),parseInt(mt11[3]),"typeA",width/2,60,1,-1);
    joker = new Monster(mt12[0],parseInt(mt12[1]),parseInt(mt12[2]),parseInt(mt12[3]),"typeA",width/2,60,1,-1);
    chimera = new Monster(mt13[0],parseInt(mt13[1]),parseInt(mt13[2]),parseInt(mt13[3]),"typeB",width/2,60,1,-1);
    ganesha = new Monster(mt14[0],parseInt(mt14[1]),parseInt(mt14[2]),parseInt(mt14[3]),"typeC",width/2,60,1,-1);
    asmodeus = new Monster(mt15[0],parseInt(mt15[1]),parseInt(mt15[2]),parseInt(mt15[3]),"typeD",width/2,60,1,-1);
    succubus = new Monster(mt16[0],parseInt(mt16[1]),parseInt(mt16[2]),parseInt(mt16[3]),"typeD",width/2,60,1,-1);
    pixie3 = new Monster(mt17[0],parseInt(mt17[1]),parseInt(mt17[2]),parseInt(mt17[3]),"typeA",width/2,60,1,1);
    pixie4 = new Monster(mt18[0],parseInt(mt18[1]),parseInt(mt18[2]),parseInt(mt18[3]),"typeB",width/2,60,1,1);
    pixie5 = new Monster(mt19[0],parseInt(mt19[1]),parseInt(mt19[2]),parseInt(mt19[3]),"typeA",width/2,60,-1,-1);
    minotauros = new Monster(mt20[0],parseInt(mt20[1]),parseInt(mt20[2]),parseInt(mt20[3]),"typeA",width/2,60,-1,-1);
    yukari = new Monster(mt21[0],parseInt(mt21[1]),parseInt(mt21[2]),parseInt(mt21[3]),"typeA",width/2,60,-1,-1);
    wyvern = new Monster(mt22[0],parseInt(mt22[1]),parseInt(mt22[2]),parseInt(mt22[3]),"typeA",width/2,60,-1,-1);
    dragon = new Monster(mt23[0],parseInt(mt23[1]),parseInt(mt23[2]),parseInt(mt23[3]),"typeA",width/2,60,-1,-1);
    atena = new Monster(mt24[0],parseInt(mt24[1]),parseInt(mt24[2]),parseInt(mt24[3]),"typeA",width/2,60,-1,-1);
    alice = new Monster(mt25[0],parseInt(mt25[1]),parseInt(mt25[2]),parseInt(mt25[3]),"typeA",width/2,60,-1,-1);
    lucifer = new Monster(mt26[0],parseInt(mt26[1]),parseInt(mt26[2]),parseInt(mt26[3]),"typeA",width/2,60,-1,-1);
    yamatanoorochi = new Monster(mt27[0],parseInt(mt27[1]),parseInt(mt27[2]),parseInt(mt27[3]),"typeA",width/2,60,-1,-1);
    String [] bg_pics = loadStrings("background.txt");
    title = loadImage(bg_pics[0]);
    bg1 = loadImage(bg_pics[1]);
    bg2 = loadImage(bg_pics[2]);
    bg3 = loadImage(bg_pics[3]);
    bg4 = loadImage(bg_pics[4]);
    bg5 = loadImage(bg_pics[5]);
    bg6 = loadImage(bg_pics[6]);
    bg7 = loadImage(bg_pics[7]);
    bg8 = loadImage(bg_pics[8]);
    bg9 = loadImage(bg_pics[9]);
    bg10 = loadImage(bg_pics[10]);
    bg11 = loadImage(bg_pics[11]);
    bg12 = loadImage(bg_pics[12]);
    bg13 = loadImage(bg_pics[13]);
    bg14 = loadImage(bg_pics[14]);
    String[] effect_pics = loadStrings("effect.txt");
    fe = loadImage(effect_pics[0]);
    //cx = new CX2(800,600);
    //r3d = new RED_3D();
    //bi = new Birds(width,height);
    st = new stageView();
}

void draw(){
    st.view();
    fill(255);
    textAlign(CENTER);
    text("Score : "+nf(score,10),width/2,60);
    //print_time();
    //score();
  }
void print_time(){
    ft = (float)millis()/1000;
    textAlign(RIGHT);
    text(nf(ft,1,2),width,24);
  }
void score(){
    textAlign(CENTER);
    text("Score : "+nf(score,10),width/2,60);
  }
void restart(){
    gameover = false;
    score = 0;
  }
//
class Ship {
  int hp;
  int sx, sy;
  PImage wiz;
  Ship() {
    hp = 30;
    //sx = mouseX;
    //sy = mouseY;
    sx = width/2;
    sy = 500;
    wiz = loadImage("data/vivid3/jk.png");
  }
  void hit() {
    hp--;
    fill(256);
    textAlign(CENTER);
    text("Hit",sx,sy);
    if (hp <= 0){
      gameover = true;
    }
  }
  void update(){
    if (mousePressed) {
         stroke(255,255,255);
        line(sx,sy-7,sx,0);
    }
    sx = mouseX;
    sy = mouseY;
    image(wiz,sx,sy,50,120);
  }
}
  class Fireball{
    float tx, ty, tr, dx, dy;
    int dr,dg,db;
    Fireball(float x,float y,float r,float ldx,float ldy,int rc,int gc,int bc){
      tx = x;
      ty = y;
      tr = r;
      dx = ldx;
      dy = ldy;
      dr = rc;
      dg =gc;
      db =bc;
    }
    public boolean update(){
      tx += dx;
      ty += dy;
      stroke(255,255,0);
      fill(dr,dg,db);
      ellipse(tx,ty,tr,tr);
      if (ty > height || ty < 0 || tx > width || tx < 0){
        return false;
      }
      
      if(dist(tx,ty,ship.sx,ship.sy) < tr/2){
        ship.hit();
      }
      return true;
    }
  }//
  class Monster{
    int hp,sw,sh;
    float sx,sy,scx,scy,sxx,syy;
    ArrayList danmaku;
    PImage bimg;
    String type;
    Monster(String imgsrc,int w,int h,int hpp,String tp,float x,float y,float dxxx,float dyyy){
      sx = scx = x;
      sy = scy = y;
      sw = w;
      sh = h;
      sxx = dxxx;
      syy = dyyy;
      hp = hpp;
      type = tp;
      danmaku = new ArrayList();
      bimg = loadImage(imgsrc);
    }
  //
  void hit() {
    hp--;
    textAlign(CENTER);
    text("Hit",sx,sy);
    if (hp <= 0) 
      gameover = true;
  }
  //
    PVector get_normalV(float vx,float vy){
      PVector v = new PVector(vx,vy);
      v.normalize();
      return v;
    }
    void fire(float x,float y,String mode){
      if(mode == "slow"){
        PVector v = get_normalV(ship.sx-x,ship.sy-y);
        danmaku.add(new Fireball(x,y,70,v.x*4,v.y*4,255,0,0));
      }
      if(mode == "fast"){
        PVector v = get_normalV(ship.sx-x,ship.sy-y);
        danmaku.add(new Fireball(x,y,70,v.x*4,v.y*4,255,0,0));
        danmaku.add(new Fireball(x,y,10,v.x*8,v.y*8,255,0,0));
      }
      if(mode == "360"){
        for(int i=0;i<360;i+=10){ 
          float rad = radians(i);
          danmaku.add(new Fireball(x,y,10,cos(random(rad)), sin(random(rad)),255,0,0));
        }
      }
      if(mode == "a"){
        for(int i=0;i<360;i+=10){ 
          float rad = radians(i);
          danmaku.add(new Fireball(x,y,10,cos(random(rad)), tan(random(rad)),255,0,0));
        }
      }
      if(mode == "b"){
        for(int i=0;i<360;i+=10){ 
          float rad = radians(i);
          danmaku.add(new Fireball(x, y, 10, cos(random(rad)), cos(random(rad)),255,0,0));
        }
      }
    }
    void thunder(float x,float y,String mode){
      if(mode == "slow"){
        PVector v = get_normalV(ship.sx-x,ship.sy-y);
        danmaku.add(new Fireball(x,y,70,v.x*4,v.y*4,0,0,255));
      }
      if(mode == "fast"){
        PVector v = get_normalV(ship.sx-x,ship.sy-y);
        danmaku.add(new Fireball(x,y,70,v.x*4,v.y*4,0,0,255));
        danmaku.add(new Fireball(x,y,10,v.x*8,v.y*8,0,0,255));
      }
      if(mode == "360"){
        for(int i=0;i<360;i+=10){ 
          float rad = radians(i);
          danmaku.add(new Fireball(x,y,10,cos(random(rad)), sin(random(rad)),0,0,255));
        }
      }
      if(mode == "a"){
        for(int i=0;i<360;i+=10){ 
          float rad = radians(i);
          danmaku.add(new Fireball(x,y,10,cos(random(rad)), tan(random(rad)),0,0,255));
        }
      }
      if(mode == "b"){
        for(int i=0;i<360;i+=10){ 
          float rad = radians(i);
          danmaku.add(new Fireball(x, y, 10, cos(random(rad)), cos(random(rad)),255,0,0));
        }
      }
    }
    void blizzard(float x,float y,String mode){
      if(mode == "slow"){
        PVector v = get_normalV(ship.sx-x,ship.sy-y);
        danmaku.add(new Fireball(x,y,70,v.x*4,v.y*4,255,255,255));
      }
      if(mode == "fast"){
        PVector v = get_normalV(ship.sx-x,ship.sy-y);
        danmaku.add(new Fireball(x,y,70,v.x*4,v.y*4,255,255,255));
        danmaku.add(new Fireball(x,y,10,v.x*8,v.y*8,255,255,255));
      }
      if(mode == "360"){
        for(int i=0;i<360;i+=10){ 
          float rad = radians(i);
          danmaku.add(new Fireball(x,y,10,cos(random(rad)), sin(random(rad)),255,255,255));
        }
      }
      if(mode == "a"){
        for(int i=0;i<360;i+=10){ 
          float rad = radians(i);
          danmaku.add(new Fireball(x,y,10,cos(random(rad)), tan(random(rad)),255,255,255));
        }
      }
      if(mode == "b"){
        for(int i=0;i<360;i+=10){ 
          float rad = radians(i);
          danmaku.add(new Fireball(x, y, 10, cos(random(rad)), cos(random(rad)),255,0,0));
        }
      }
    }
  //
  void update() {
    // boss update
      float dx,dy;
      image(bimg,sx,sy,sw,sh);
      if(type == "typeA"){
        dx = 300.0f*sin(radians(frameCount*4))*sxx;
        dy = 50.0f*cos(radians(frameCount*4))*syy;
        sx = scx+dx;
        sy = scy+dy;
        if(frameCount%30 == 0){
          image(bimg,sx,sy,sw,sh);
          if(hp>200){
            fire(sx+dx,sy,"360");
          }else if(hp>150){
            fire(sx+dx,sy,"a");
          }else if(hp>130){
            fire(sx+dx,sy,"b");
          }else if(hp>100){
            fire(sx,sy,"slow");
          }else if(hp>80){
            fire(sx,sy,"fast");
          }else if(hp>0){
            if(frameCount%20 == 0)
              fire(sx,sy,"slow");
            if(frameCount%10 == 0){
              fire(sx,sy,"fast");
            }
          }
        }
      }
      if(type == "typeB"){
        dy = 150.0f*cos(radians(frameCount*4))*syy;
        sy = scy+dy;
        if(frameCount%30 == 0){
          image(bimg,sx,sy,sw,sh);
          fire(sx,sy+dy,"a");
        }
      }
      if(type == "typeC"){
        dx = 150.0f*cos(radians(frameCount*4))*sxx;
        sx = scx+dx;
        if(frameCount%30 == 0){
          image(bimg,sx,sy,sw,sh);
          fire(sx+dx,sy,"a");
          fire(sx+dx,sy,"b");
        }
      }
      if(type == "typeD"){
        dx = 150.0f*cos(radians(frameCount*4))*sxx;
        sx = scx+dx;
        if(frameCount%30 == 0){
          image(bimg,sx,sy,sw,sh);
          fire(sx+dx,sy,"a");
          fire(sx+dx,sy,"slow");
          fire(sx+dx,sy,"fast");
        }
      }
      if(type == "typeE"){
        dx = 150.0f*cos(radians(frameCount*4))*sxx;
        sx = scx+dx;
        if(frameCount%30 == 0){
          image(bimg,sx,sy,sw,sh);
          thunder(sx+dx,sy,"a");
          thunder(sx+dx,sy,"360");
        }
      }
      if(type == "typeF"){
        dx = 150.0f*cos(radians(frameCount*4))*sxx;
        sx = scx+dx;
        if(frameCount%30 == 0){
          image(bimg,sx,sy,sw,sh);
          thunder(sx+dx,sy,"b");
          thunder(sx+dx,sy,"fast");
        }
      }
      if(type == "typeG"){
        dx = 150.0f*cos(radians(frameCount*4))*sxx;
        sx = scx+dx;
        if(frameCount%30 == 0){
          image(bimg,sx,sy,sw,sh);
          thunder(sx+dx,sy,"a");
          thunder(sx+dx,sy,"360");
        }
      }
      if(type == "typeH"){
        dx = 150.0f*cos(radians(frameCount*4))*sxx;
        sx = scx+dx;
        if(frameCount%30 == 0){
          image(bimg,sx,sy,sw,sh);
          blizzard(sx+dx,sy,"360");
          blizzard(sx+dx,sy,"360");
        }
      }   
    // danmaku update
    for (int i = danmaku.size() -1; i >= 0; i--) {
      Fireball t = (Fireball)danmaku.get(i);
      if (t.update() == false)
        danmaku.remove(i);
    }
  }
}
class stageView{
    String[] ssx;
    String[] ssm1,ssm2;
    Monster mons1,mons2;
    String monn;
    stageView(){
      ssx = loadStrings("data/vivid3/stage.txt");
      ssm1 = split(ssx[0]," ");
      ssm2 = split(ssx[1]," ");
    }
    void view(){
      if(keyPressed && key == 'r'){
        background(0);
        gameover = false;
        ship.hp = 30;
        ship.sx=width/2;
        ship.sy=height;
        stage = 0;
        score = 0;
      }
      if(stage == 0){
        background(0);
        fill(255);
        text("Acid Core",width/2,height/2);
        text("Press MouseButton",width/2,400);
        text("Copyright@takamitu hamada 2015",width/2,500);
        if(mousePressed || (keyPressed && key == 's')){
          stage ++;
        }
      }
      if(enemydestroy){
        if(stage == 24){
          fill(255,255,255);
          text("Conguratuation",width/2,height/2);
        }else{
          fill(255,255,255);
          text("Next Stage",width/2,height/2);
          stage ++;
          enemydestroy = false;
        }
      }else{
        if(stage == 1){
          if(pixie1.hp <=0 || pixie2.hp <= 0){
            background(0);
            //cx.snow_circle(0,0,width,height);
          }else{
            background(bg1);
          }
          if(ship.hp>0){
            //ship.update(mouseX,mouseY);
            ship.update();
          }else{
            image(fe,ship.sx,ship.sy,128,128);
            gameover = true;
          }
          if(pixie1.hp>0){
            pixie1.update();
          }else{
            image(fe,pixie1.sx,pixie1.sy,125,125);
          }
          if(pixie2.hp>0){
            pixie2.update();
          }else{
            image(fe,pixie2.sx,pixie2.sy,125,125);
          }
          if(pixie1.hp <= 0 && pixie2.hp <= 0){
            enemydestroy = true;
          }
          if(abs(ship.sx-pixie1.sx) < (pixie1.sw/2)){
            pixie1.hit();
            score += 10;
            if(pixie1.hp < 0 && ft < 50){
              score += 1000;
              ship.hp += 10;
            }
          }
          if(abs(ship.sx-pixie2.sx) < (pixie2.sw/2)){
            pixie2.hit();
            score += 10;
            if(pixie2.hp < 0 && ft < 50){
              score += 1000;
              ship.hp += 10;
            }
          }
          if(dist(pixie1.sx,pixie1.sy,ship.sx,ship.sy) < pixie1.sx/2 
              || dist(pixie1.sx,pixie1.sy,ship.sx,ship.sy) < pixie1.sy/2 
              || dist(pixie2.sx,pixie2.sy,ship.sx,ship.sy) < pixie1.sx/2 
              || dist(pixie2.sx,pixie2.sy,ship.sx,ship.sy) < pixie2.sy/2){
            ship.hit();
          }
        }
        if(stage == 2){
          background(bg2);
          //(bg1,0,0,width,height,0,0,width,height,SUBTRACT);
          if(ship.hp>0){
            ship.update();
          }else{
            image(fe,ship.sx,ship.sy,128,128);
          }
          if(ship.hp <= 0){
            gameover = true;
          }
          if(lizardman.hp>0){
            lizardman.update();
          }else{
            image(fe,lizardman.sx,lizardman.sy,125,125);
          }
          if(lizardman.hp <= 0){
            enemydestroy = true;
          }
          if(abs(ship.sx-lizardman.sx) < (lizardman.sw/2)){
            lizardman.hit();
            score = score+10;
            if(lizardman.hp < 0 && ft < 100){
              score += 2000;
            }
          }
          if(dist(lizardman.sx,lizardman.sy,ship.sx,ship.sy) < lizardman.sx/2 
              || dist(lizardman.sx,lizardman.sy,ship.sx,ship.sy) < lizardman.sy/2){
            ship.hit();
          }
        }
        if(stage == 3){
          background(bg3);
          //r3d.draw(0, 0, width, height);
          if(ship.hp>0){
            ship.update();
          }else{
            image(fe,ship.sx,ship.sy,128,128);
          }
          if(ship.hp <= 0){
            gameover = true;
          }
          if(lilim.hp>0){
            lilim.update();
          }else{
            image(fe,lilim.sx,lilim.sy,125,125);
          }
          if(lilim.hp <= 0){
            enemydestroy = true;
          }
          if(abs(ship.sx-lilim.sx) < (lilim.sw/2)){
            lilim.hit();
            score = score+10;
            if(lilim.hp < 0 && ft < 150){
              score += 3000;
            }
          }
          if(dist(lilim.sx,lilim.sy,ship.sx,ship.sy) < lilim.sx/2 
              || dist(lilim.sx,lilim.sy,ship.sx,ship.sy) < lilim.sy/2){
            ship.hit();
          }
        }    
        if(stage == 4){
          background(bg4);
          if(ship.hp>0){
            ship.update();
          }else{
            image(fe,ship.sx,ship.sy,128,128);
          }
          if(ship.hp <= 0){
            gameover = true;
          }
          if(lilith.hp>0){
            lilith.update();
          }else{
            image(fe,lilith.sx,lilith.sy,125,125);
          }
          if(lilith.hp <= 0){
            enemydestroy = true;
          }
          if(abs(ship.sx-lilith.sx) < (lilith.sw/2)){
            lilith.hit();
            score = score+10;
            if(lilith.hp < 0 && ft < 150){
              score += 3000;
            }
          }
          if(dist(lilith.sx,lilith.sy,ship.sx,ship.sy) < lilith.sx/2 
              || dist(lilith.sx,lilith.sy,ship.sx,ship.sy) < lilith.sy/2){
            ship.hit();
          }
        }
        if(stage == 5){
          background(bg6);
          if(ship.hp>0){
            ship.update();
          }else{
            image(fe,ship.sx,ship.sy,128,128);
          }
          if(ship.hp <= 0){
            gameover = true;
          }
          if(ibitsureimu.hp>0){
            ibitsureimu.update();
          }else{
            image(fe,ibitsureimu.sx,ibitsureimu.sy,125,125);
          }
          if(ibitsureimu.hp <= 0){
            enemydestroy = true;
          }
          if(abs(ship.sx-ibitsureimu.sx) < (ibitsureimu.sw/2)){
            ibitsureimu.hit();
            score = score+10;
            if(ibitsureimu.hp < 0 && ft < 150){
              score += 3000;
            }
          }
          if(dist(ibitsureimu.sx,ibitsureimu.sy,ship.sx,ship.sy) < ibitsureimu.sx/2 
              || dist(ibitsureimu.sx,ibitsureimu.sy,ship.sx,ship.sy) < ibitsureimu.sy/2){
            ship.hit();
          }
        }
        if(stage == 6){
          background(0);
          //cx.card_shuffle(0,0,width,height);
          if(ship.hp>0){
            ship.update();
          }else{
            image(fe,ship.sx,ship.sy,128,128);
          }
          if(ship.hp <= 0){
            gameover = true;
          }
          if(kyuubi.hp>0){
            kyuubi.update();
          }else{
            image(fe,kyuubi.sx,kyuubi.sy,125,125);
          }
          if(kyuubi.hp <= 0){
            enemydestroy = true;
          }
          if(abs(ship.sx-kyuubi.sx) < (kyuubi.sw/2)){
            kyuubi.hit();
            score = score+10;
            if(kyuubi.hp < 0 && ft < 150){
              score += 3000;
            }
          }
          if(dist(kyuubi.sx,kyuubi.sy,ship.sx,ship.sy) < kyuubi.sx/2 
              || dist(kyuubi.sx,kyuubi.sy,ship.sx,ship.sy) < kyuubi.sy/2){
            ship.hit();
          }
        }
        if(stage == 7){
          background(bg5);
          //cx.RBW(0, 0, width, height);
          if(ship.hp>0){
            ship.update();
          }else{
            image(fe,ship.sx,ship.sy,128,128);
          }
          if(ship.hp <= 0){
            gameover = true;
          }
          if(kali.hp>0){
            kali.update();
          }else{
            image(fe,kali.sx,kali.sy,125,125);
          }
          if(kali.hp <= 0){
            enemydestroy = true;
          }
          if(abs(ship.sx-kali.sx) < (kali.sw/2)){
            kali.hit();
            score = score+10;
            if(kali.hp < 0 && ft < 150){
              score += 3000;
            }
          }
          if(dist(kali.sx,kali.sy,ship.sx,ship.sy) < kali.sx/2 
              || dist(kali.sx,kali.sy,ship.sx,ship.sy) < kali.sy/2){
            ship.hit();
          }
        }
        if(stage == 8){
          background(bg1);
          //(bg2,0,0,width,height,0,0,width,height,SUBTRACT);
          if(ship.hp>0){
            ship.update();
          }else{
            image(fe,ship.sx,ship.sy,128,128);
          }
          if(ship.hp <= 0){
            gameover = true;
          }
          if(joker.hp>0){
            joker.update();
          }else{
            image(fe,joker.sx,joker.sy,125,125);
          }
          if(joker.hp <= 0){
            enemydestroy = true;
          }
          if(abs(ship.sx-joker.sx) < (joker.sw/2)){
            joker.hit();
            score = score+10;
            if(joker.hp < 0 && ft < 150){
              score += 3000;
            }
          }
          if(dist(joker.sx,joker.sy,ship.sx,ship.sy) < joker.sx/2 || dist(joker.sx,joker.sy,ship.sx,ship.sy) < joker.sy/2){
            ship.hit();
          }
          if(abs(ship.sx-joker.sx) < (joker.sw/2)){
            joker.hit();
            score = score+10;
            if(joker.hp < 0 && ft < 150){
              score += 3000;
            }
          }
          if(dist(joker.sx,joker.sy,ship.sx,ship.sy) < joker.sx/2 || dist(joker.sx,joker.sy,ship.sx,ship.sy) < joker.sy/2){
            ship.hit();
          }
        }
        if(stage == 9){
          background(bg1);
          //(bg2,0,0,width,height,0,0,width,height,SUBTRACT);
          if(ship.hp>0){
            ship.update();
          }else{
            image(fe,ship.sx,ship.sy,128,128);
          }
          if(ship.hp <= 0){
            gameover = true;
          }
          if(valkyrie.hp>0){
            valkyrie.update();
          }else{
            image(fe,valkyrie.sx,valkyrie.sy,125,125);
          }
          if(valkyrie.hp <= 0){
            enemydestroy = true;
          }
          if(abs(ship.sx-valkyrie.sx) < (valkyrie.sw/2)){
            valkyrie.hit();
            score = score+10;
            if(valkyrie.hp < 0 && ft < 100){
              score += 2000;
            }
          }
          if(dist(valkyrie.sx,valkyrie.sy,ship.sx,ship.sy) < valkyrie.sx/2 || dist(valkyrie.sx,valkyrie.sy,ship.sx,ship.sy) < valkyrie.sy/2){
            ship.hit();
          }
        }
        if(stage == 10){
          background(bg8);
          //(bg9,0,0,width,height,0,0,width,height,SUBTRACT);
          if(ship.hp>0){
            ship.update();
          }else{
            image(fe,ship.sx,ship.sy,128,128);
          }
          if(ship.hp <= 0){
            gameover = true;
          }
          if(pflower.hp>0){
            pflower.update();
          }else{
            image(fe,pflower.sx,pflower.sy,125,125);
          }
          if(pixie3.hp>0){
            pixie3.update();
          }else{
            image(fe,pixie3.sx,pixie3.sy,125,125);
          }
          if(pixie4.hp>0){
            pixie4.update();
          }else{
            image(fe,pixie4.sx,pixie4.sy,125,125);
          }
          if(pixie5.hp>0){
            pixie5.update();
          }else{
            image(fe,pixie5.sx,pixie5.sy,125,125);
          }
          
          if(pflower.hp <= 0 && pixie3.hp <= 0 && pixie4.hp <=0 && pixie5.hp <= 0){
            enemydestroy = true;
          }
          if(abs(ship.sx-pflower.sx) < (pflower.sw/2)){
            pflower.hit();
            score = score+10;
            if(pflower.hp < 0 && ft < 100){
              score += 2000;
            }
          }
          if(abs(ship.sx-pixie3.sx) < (pixie3.sw/2)){
            pixie3.hit();
            score = score+10;
            if(pixie3.hp < 0 && ft < 100){
              score += 2000;
            }
          }
          if(abs(ship.sx-pixie4.sx) < (pixie4.sw/2)){
            pixie4.hit();
            score = score+10;
            if(pixie4.hp < 0 && ft < 100){
              score += 2000;
            }
          }
          if(abs(ship.sx-pixie5.sx) < (pixie5.sw/2)){
            pixie5.hit();
            score = score+10;
            if(pixie5.hp < 0 && ft < 100){
              score += 2000;
            }
          }
          
          if(dist(pflower.sx,pflower.sy,ship.sx,ship.sy) < pflower.sx/2 || dist(pflower.sx,pflower.sy,ship.sx,ship.sy) < pflower.sy/2
              || dist(pixie3.sx,pixie3.sy,ship.sx,ship.sy) < pixie3.sx/2 || dist(pixie3.sx,pixie3.sy,ship.sx,ship.sy) < pixie3.sy/2
              || dist(pixie4.sx,pixie4.sy,ship.sx,ship.sy) < pixie4.sx/2 || dist(pixie4.sx,pixie4.sy,ship.sx,ship.sy) < pixie4.sy/2
              || dist(pixie5.sx,pixie5.sy,ship.sx,ship.sy) < pixie5.sx/2 || dist(pixie5.sx,pixie5.sy,ship.sx,ship.sy) < pixie5.sy/2){
            ship.hit();
          }
        }
        if(stage == 11){
          background(bg8);
          //(bg9,0,0,width,height,0,0,width,height,SUBTRACT);
          if(ship.hp>0){
            ship.update();
          }else{
            image(fe,ship.sx,ship.sy,128,128);
          }
          if(ship.hp <= 0){
            gameover = true;
          }
          if(witch.hp>0){
            witch.update();
          }else{
            image(fe,witch.sx,witch.sy,125,125);
          }
          if(witch.hp <= 0){
            enemydestroy = true;
          }
          if(abs(ship.sx-witch.sx) < (witch.sw/2)){
            witch.hit();
            score = score+10;
            if(witch.hp < 0 && ft < 100){
              score += 2000;
            }
          }
          if(dist(witch.sx,witch.sy,ship.sx,ship.sy) < witch.sx/2 || dist(witch.sx,witch.sy,ship.sx,ship.sy) < witch.sy/2){
            ship.hit();
          }
        }
        if(stage == 12){
          background(bg10);
          //(bg9,0,0,width,height,0,0,width,height,SUBTRACT);
          if(ship.hp>0){
            ship.update();
          }else{
            image(fe,ship.sx,ship.sy,128,128);
            gameover = true;
          }
          if(nyarlathotep.hp>0){
            nyarlathotep.update();
          }else{
            image(fe,nyarlathotep.sx,nyarlathotep.sy,125,125);
          }
          if(nyarlathotep.hp <= 0){
            enemydestroy = true;
          }
          if(abs(ship.sx-nyarlathotep.sx) < (nyarlathotep.sw/2)){
            nyarlathotep.hit();
            score += 10;
            if(nyarlathotep.hp < 0 && ft < 50){
              score += 10000;
            }
          }
          if(dist(nyarlathotep.sx,nyarlathotep.sy,ship.sx,ship.sy) < nyarlathotep.sx/2 || dist(nyarlathotep.sx,nyarlathotep.sy,ship.sx,ship.sy) < nyarlathotep.sy/2){
            ship.hit();
          }
        }
        if(stage == 13){
          background(bg10);
          //(bg9,0,0,width,height,0,0,width,height,SUBTRACT);
          if(ship.hp>0){
            ship.update();
          }else{
            image(fe,ship.sx,ship.sy,128,128);
            gameover = true;
          }
          if(chimera.hp>0){
            chimera.update();
          }else{
            image(fe,chimera.sx,chimera.sy,125,125);
          }
          if(chimera.hp <= 0){
            enemydestroy = true;
          }
          if(abs(ship.sx-chimera.sx) < (chimera.sw/2)){
            chimera.hit();
            score += 10;
            if(chimera.hp < 0 && ft < 50){
              score += 10000;
            }
          }
          if(dist(chimera.sx,chimera.sy,ship.sx,ship.sy) < chimera.sx/2 || dist(chimera.sx,chimera.sy,ship.sx,ship.sy) < chimera.sy/2){
            ship.hit();
          }
        }
        if(stage == 14){
          background(bg10);
          //(bg9,0,0,width,height,0,0,width,height,SUBTRACT);
          if(ship.hp>0){
            ship.update();
          }else{
            image(fe,ship.sx,ship.sy,128,128);
            gameover = true;
          }
          if(ganesha.hp>0){
            ganesha.update();
          }else{
            image(fe,ganesha.sx,ganesha.sy,125,125);
          }
          if(ganesha.hp <= 0){
            enemydestroy = true;
          }
          if(abs(ship.sx-ganesha.sx) < (ganesha.sw/2)){
            ganesha.hit();
            score += 10;
            if(ganesha.hp < 0 && ft < 50){
              score += 10000;
            }
          }
          if(dist(ganesha.sx,ganesha.sy,ship.sx,ship.sy) < ganesha.sx/2 || dist(ganesha.sx,ganesha.sy,ship.sx,ship.sy) < ganesha.sy/2){
            ship.hit();
          }
        }
        if(stage == 15){
          background(bg10);
          //(bg9,0,0,width,height,0,0,width,height,SUBTRACT);
          if(ship.hp>0){
            ship.update();
          }else{
            image(fe,ship.sx,ship.sy,128,128);
            gameover = true;
          }
          if(asmodeus.hp>0){
            asmodeus.update();
          }else{
            image(fe,asmodeus.sx,asmodeus.sy,125,125);
          }
          if(asmodeus.hp <= 0){
            enemydestroy = true;
          }
          if(abs(ship.sx-asmodeus.sx) < (asmodeus.sw/2)){
            asmodeus.hit();
            score += 10;
            if(asmodeus.hp < 0 && ft < 50){
              score += 10000;
            }
          }
          if(dist(asmodeus.sx,asmodeus.sy,ship.sx,ship.sy) < asmodeus.sx/2 || dist(asmodeus.sx,asmodeus.sy,ship.sx,ship.sy) < asmodeus.sy/2){
            ship.hit();
          }
        }
        if(stage == 16){
          background(bg10);
          //(bg9,0,0,width,height,0,0,width,height,SUBTRACT);
          if(ship.hp>0){
            ship.update();
          }else{
            image(fe,ship.sx,ship.sy,128,128);
            gameover = true;
          }
          if(succubus.hp>0){
            succubus.update();
          }else{
            image(fe,succubus.sx,succubus.sy,125,125);
          }
          if(succubus.hp <= 0){
            enemydestroy = true;
          }
          if(abs(ship.sx-succubus.sx) < (succubus.sw/2)){
            succubus.hit();
            score += 10;
            if(succubus.hp < 0 && ft < 50){
              score += 10000;
            }
          }
          if(dist(succubus.sx,succubus.sy,ship.sx,ship.sy) < succubus.sx/2 || dist(succubus.sx,succubus.sy,ship.sx,ship.sy) < succubus.sy/2){
            ship.hit();
          }
        }
        if(stage == 17){
          background(bg1);
          if(ship.hp>0){
            ship.update();
          }else{
            image(fe,ship.sx,ship.sy,128,128);
            gameover = true;
          }
          if(minotauros.hp>0){
            minotauros.update();
          }else{
            image(fe,minotauros.sx,minotauros.sy,125,125);
          }
          if(minotauros.hp <= 0){
            enemydestroy = true;
          }
          if(abs(ship.sx-minotauros.sx) < (minotauros.sw/2)){
            minotauros.hit();
            score += 10;
            if(minotauros.hp < 0 && ft < 50){
              score += 10000;
            }
          }
          if(dist(minotauros.sx,minotauros.sy,ship.sx,ship.sy) < minotauros.sx/2 || dist(minotauros.sx,minotauros.sy,ship.sx,ship.sy) < minotauros.sy/2){
            ship.hit();
          }
        }
        if(stage == 18){
          background(bg2);
          if(ship.hp>0){
            ship.update();
          }else{
            image(fe,ship.sx,ship.sy,128,128);
            gameover = true;
          }
          if(yukari.hp>0){
            yukari.update();
          }else{
            image(fe,yukari.sx,yukari.sy,125,125);
          }
          if(yukari.hp <= 0){
            enemydestroy = true;
          }
          if(abs(ship.sx-yukari.sx) < (yukari.sw/2)){
            yukari.hit();
            score += 10;
            if(yukari.hp < 0 && ft < 50){
              score += 10000;
            }
          }
          if(dist(yukari.sx,yukari.sy,ship.sx,ship.sy) < yukari.sx/2 || dist(yukari.sx,yukari.sy,ship.sx,ship.sy) < yukari.sy/2){
            ship.hit();
          }
        }
        if(stage == 19){
          background(bg3);
          if(ship.hp>0){
            ship.update();
          }else{
            image(fe,ship.sx,ship.sy,128,128);
            gameover = true;
          }
          if(wyvern.hp>0){
            wyvern.update();
          }else{
            image(fe,wyvern.sx,wyvern.sy,125,125);
          }
          if(wyvern.hp <= 0){
            enemydestroy = true;
          }
          if(abs(ship.sx-wyvern.sx) < (wyvern.sw/2)){
            wyvern.hit();
            score += 10;
            if(wyvern.hp < 0 && ft < 50){
              score += 10000;
            }
          }
          if(dist(wyvern.sx,wyvern.sy,ship.sx,ship.sy) < wyvern.sx/2 || dist(wyvern.sx,wyvern.sy,ship.sx,ship.sy) < wyvern.sy/2){
            ship.hit();
          }
        }
        if(stage == 20){
          background(bg4);
          if(ship.hp>0){
            ship.update();
          }else{
            image(fe,ship.sx,ship.sy,128,128);
            gameover = true;
          }
          if(dragon.hp>0){
            dragon.update();
          }else{
            image(fe,dragon.sx,dragon.sy,125,125);
          }
          if(dragon.hp <= 0){
            enemydestroy = true;
          }
          if(abs(ship.sx-dragon.sx) < (dragon.sw/2)){
            dragon.hit();
            score += 10;
            if(dragon.hp < 0 && ft < 50){
              score += 10000;
            }
          }
          if(dist(dragon.sx,dragon.sy,ship.sx,ship.sy) < dragon.sx/2 || dist(dragon.sx,dragon.sy,ship.sx,ship.sy) < dragon.sy/2){
            ship.hit();
          }
        }
        if(stage == 21){
          background(bg5);
          //(bg9,0,0,width,height,0,0,width,height,SUBTRACT);
          if(ship.hp>0){
            ship.update();
          }else{
            image(fe,ship.sx,ship.sy,128,128);
            gameover = true;
          }
          if(atena.hp>0){
            atena.update();
          }else{
            image(fe,atena.sx,atena.sy,125,125);
          }
          if(atena.hp <= 0){
            enemydestroy = true;
          }
          if(abs(ship.sx-atena.sx) < (atena.sw/2)){
            atena.hit();
            score += 10;
            if(atena.hp < 0 && ft < 50){
              score += 10000;
            }
          }
          if(dist(atena.sx,atena.sy,ship.sx,ship.sy) < atena.sx/2 || dist(atena.sx,atena.sy,ship.sx,ship.sy) < atena.sy/2){
            ship.hit();
          }
        }
        if(stage == 22){
          background(bg6);
          //(bg9,0,0,width,height,0,0,width,height,SUBTRACT);
          if(ship.hp>0){
            ship.update();
          }else{
            image(fe,ship.sx,ship.sy,128,128);
            gameover = true;
          }
          if(alice.hp>0){
            alice.update();
          }else{
            image(fe,alice.sx,alice.sy,125,125);
          }
          if(alice.hp <= 0){
            enemydestroy = true;
          }
          if(abs(ship.sx-alice.sx) < (alice.sw/2)){
            alice.hit();
            score += 10;
            if(alice.hp < 0 && ft < 50){
              score += 10000;
            }
          }
          if(dist(alice.sx,alice.sy,ship.sx,ship.sy) < alice.sx/2 || dist(alice.sx,alice.sy,ship.sx,ship.sy) < alice.sy/2){
            ship.hit();
          }
        }
        if(stage == 23){
          background(bg7);
          //(bg9,0,0,width,height,0,0,width,height,SUBTRACT);
          if(ship.hp>0){
            ship.update();
          }else{
            image(fe,ship.sx,ship.sy,128,128);
            gameover = true;
          }
          if(lucifer.hp>0){
            lucifer.update();
          }else{
            image(fe,lucifer.sx,lucifer.sy,125,125);
          }
          if(lucifer.hp <= 0){
            enemydestroy = true;
          }
          if(abs(ship.sx-lucifer.sx) < (lucifer.sw/2)){
            lucifer.hit();
            score += 10;
            if(lucifer.hp < 0 && ft < 50){
              score += 10000;
            }
          }
          if(dist(lucifer.sx,lucifer.sy,ship.sx,ship.sy) < lucifer.sx/2 || dist(lucifer.sx,lucifer.sy,ship.sx,ship.sy) < lucifer.sy/2){
            ship.hit();
          }
        }
        if(stage == 24){
          background(bg7);
          //(bg9,0,0,width,height,0,0,width,height,SUBTRACT);
          if(ship.hp>0){
            ship.update();
          }else{
            image(fe,ship.sx,ship.sy,128,128);
            gameover = true;
          }
          if(yamatanoorochi.hp>0){
            yamatanoorochi.update();
          }else{
            image(fe,yamatanoorochi.sx,yamatanoorochi.sy,125,125);
          }
          if(yamatanoorochi.hp <= 0){
            enemydestroy = true;
          }
          if(abs(ship.sx-yamatanoorochi.sx) < (yamatanoorochi.sw/2)){
            yamatanoorochi.hit();
            score += 10;
            if(yamatanoorochi.hp < 0 && ft < 50){
              score += 10000;
            }
          }
          if(dist(yamatanoorochi.sx,yamatanoorochi.sy,ship.sx,ship.sy) < yamatanoorochi.sx/2 || dist(yamatanoorochi.sx,yamatanoorochi.sy,ship.sx,ship.sy) < yamatanoorochi.sy/2){
            ship.hit();
          }
        }
      }
      if(gameover){
        if(ship.hp <= 0){
          fill(255,255,255);
          textAlign(CENTER);
          text("Game Over",width/2,height/2);
        }
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
    int birdCount = 2000;
    Bird[]birds = new Bird[birdCount];
    float[]x = new float[birdCount];
    float[]y = new float[birdCount];
    float[]z = new float[birdCount];
    float[]rx = new float[birdCount];
    float[]ry = new float[birdCount];
    float[]rz = new float[birdCount];
    float[]spd = new float[birdCount];
    float[]rot = new float[birdCount];
    Birds(int wi,int hi){
      size(wi,hi,P3D);
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
    public void draw(int dx,int dy,int wi,int hi){
    PGraphics pg = createGraphics(wi,hi,P3D);
     pg.lights();
      for(int i=0;i<birdCount;i++){
        birds[i].setFlight(x[i],y[i],z[i],rx[i],ry[i],rz[i]);
        birds[i].setWingSpeed(spd[i]);
        birds[i].fly();
      }
      image(pg, dx, dy);
    }
  }

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
  CX2(int wi,int hi){
   size(wi,hi);
   pg = createGraphics(wi,hi);
  }
  void card_shuffle(int dx,int dy,int wi,int hi){
  pg.beginDraw();
  pg.stroke(0);
  pg.strokeWeight(1);
  frameRate(24);
  pg.colorMode(RGB,256);
  angle += 0.01f;
  for(int i=0;i<256;i++){
      pg.translate(width/2,height/2);
      pg.rotate(sin(angle)*cos(angle)*tan(angle));
      pg.rect(i/cos(angle),-i*sin(angle),width/3,height/3);
      pg.rectMode(CENTER);
      pg.fill(0,255-random(100),255-random(100));
    }
    pg.endDraw();
    image(pg,dx,dy);
    pg.clear();
  }
  void RBW(int dx,int dy,int wi,int hi){
    pg.beginDraw();
    pg.stroke(0);
    pg.strokeWeight(1);
    angle += 0.00003f;
    for(int i=0;i<256;i++){
      pg.rotate(cos(angle)*cos(angle)+sin(angle)+tan(angle)/2);
      pg.translate(width/2,height/2);
      pg.fill(i,256-i,0);
    pg.beginShape();
    pg.vertex( -20,  i );
    pg.vertex(  20,  i );
    pg.vertex(  20,  20 );
    pg.vertex(  i,  20 );
    pg.vertex(  i, -20 );
    pg.vertex(  20, -20 );
    pg.vertex(  20, -i );
    pg.vertex( -20, -i );
    pg.vertex( -20, -20 );
    pg.vertex( -i, -20 );
    pg.vertex( -i,  20 );
    pg.vertex( -20,  20 );  
    pg.endShape(CLOSE);
      pg.fill(0,0,i);
      pg.ellipse(width/2,-i,50,50);
      pg.ellipseMode(CENTER);
      pg.fill(i,i,i);
      pg.ellipse(width/1.3f,i,10,10);
      pg.ellipseMode(CENTER);
    }
    pg.endDraw();
    image(pg,dx,dy);
    pg.clear();
  }
  void worp_man(int x, int y,int wi,int hi){
    pg.beginDraw();
    frameRate(15);
    for(int k=0;k<5;k++){
      pg.stroke(random(255),random(255),random(255));
      pg.ellipse(width/2,height/2,random(1000),random(1000));
      pg.fill(random(255),0,0,30); 
    }
    pg.endDraw();
    image(pg, x, y);
    pg.clear();
  }
  void prism(int x,int y,int wi,int hi){
    pg.beginDraw();
    pg.stroke(255);
    for(int i=0;i<5;i++){
      pg.stroke(255-random(100),255-random(100),255-random(100));
      pg.line(width/2,0,random(1000),random(1000));
      pg.rotate(radians(360));
    }
      pg.endDraw();
      image(pg,x,y);
  }
  void snow_circle(int x,int y,int wi,int hi){
    pg.beginDraw();
    angle += 0.01f;
    for(int i=0;i<256;i++){
      pg.translate(width/2,height/2);
      pg.rotate(sqrt(2)*sin(angle));
      pg.ellipse(i,i,10,10);
      pg.fill(256,256,256);
    }
    pg.endDraw();
    image(pg, x, y);
    pg.clear();
  }
  void spider_ball(float x,float y,int wi,int hi){
    pg.beginDraw();
    frameRate(24);
    pg.stroke(0);
    pg.strokeWeight(1);
    angle += 0.01f;
    for(int i = 0;i<256;i++){
      pg.translate(i,i);
      pg.rotate(cos(angle)*cos(angle));
      pg.ellipse(i,i,100,100);
      pg.fill(i,0,256-i);
    }
    image(pg, x, y);
    pg.clear();
  }
  void powerBall(){
   colorMode(HSB,100);
    noStroke();
    fadeToWhite();
    if(power>0){
      for(int i=0;i<Length;i++){
        Ang[i] += Rot[i] * (power/10);
        X[i] = cx + (power * sin(radians(Ang[i])));
        Y[i] = cy + (power * cos(radians(Ang[i])));
        fill(c[i],80,100,min(power,80));
        ellipse(X[i],Y[i],Radius[i],Radius[i]);
      }
    }
    if(mousePressed){
      cx = mouseX;
      cy = mouseY;
      if(power<MaxPower)power += 1;
    }
    else{
      if(power>1)power = power * 0.98f;
      else power=0;
    }
  }
  void fadeToWhite(){
    rectMode(CORNER);
    fill(100,30);
    rect(0,0,width,height);
  }

  void mousePressed(){
    power = 0;
    for(int i = 0;i < Length;i++){
      Radius[i] = random(10,30);
      c[i] = random(100);
      Rot[i] = random(-5,5);
    }
  }
  void rect_draw(){
    frameRate(30);
    stroke(random(256),random(256),random(256),30);
    int x = PApplet.parseInt(random(width));
    int y = PApplet.parseInt(random(height));
    rectLines(x,y,30,30);
  }
  void rectLines(int x,int y,int w,int h){
    line(x,y,x+w,y);
    line(x,y,x,y+h);
    line(x+w,y,x+w,y+h);
    line(x,y+h,x+w,y+h);
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
  void crimson_world(int x,int y,int wi,int hi){
    pg.beginDraw();
    pg.stroke(255,0,0);
    pg.colorMode(RGB);
    frameRate(10);
    pg.noFill();
    for(int i = 0;i<30;i++){
      pg.ellipse(random(width/2),random(height/2),random(width/2)+300,random(height/2)+300);
      pg.rotateX(radians(i*15));
      pg.rotateY(radians(i*5));
    }
    pg.endDraw();
    image(pg,x,y);
    pg.clear();
  }
  float xmag,ymag,newXmag,newYmag = 0;
  void qube(){ 
    noStroke();
    colorMode(RGB,1);
    pushMatrix();
    translate(width/2,height/2,-30);
    float newXmag = mouseX/PApplet.parseFloat(width)*TWO_PI;
    float newYmag = mouseY/PApplet.parseFloat(height)*TWO_PI;
    float diff = xmag-newXmag;
    if(abs(diff)>0.01f){
      xmag -= diff/4.0f;
    }
    diff = ymag-newYmag;
    if(abs(diff)>0.01f){
      ymag -= diff/4.0f;
    }
    rotateX(-ymag);
    rotateY(-xmag);
    scale(50);
    beginShape(QUADS);
    fill(0,1,1);
    vertex(-1,1,1);
    fill(1,1,1);
    vertex(1,1,1);
    fill(1,0,1);
    vertex(1,-1,1);
    fill(0,0,1);
    vertex(-1,-1,1);
    fill(1,1,1);
    vertex(1,1,1);
    fill(1,1,0);
    vertex(1,1,-1);
    fill(1,0,0);
    vertex(1,-1,-1);
    fill(1,0,1);
    vertex(1,-1,1);
    fill(1,1,0);
    vertex(1,1,-1);
    fill(0,1,0);
    vertex(-1,1,-1);
    fill(0,0,0);
    vertex(-1,-1,-1);
    fill(1,0,0);
    vertex(1,-1,-1);
    fill(0,1,0);
    vertex(-1,1,-1);
    fill(0,1,1);
    vertex(-1,1,1);
    fill(0,0,1);
    vertex(-1,-1,1);
    fill(0,0,0);
    vertex(-1,-1,-1);
    fill(0,1,0);
    vertex(-1,1,-1);
    fill(1,1,0);
    vertex(1,1,-1);
    fill(1,1,1);
    vertex(1,1,1);
    fill(0,1,1);
    vertex(-1,1,1);
    fill(0,0,0);
    vertex(-1,-1,-1);
    fill(1,0,0);
    vertex(-1,-1,-1);
    fill(1,0,1);
    vertex(1,-1,1);
    fill(0,01);
    vertex(-1,-1,1);
    endShape();
    popMatrix();
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
    public RED_3D(){
      sSize = width/5;
      fill(204,204);
      safecolor = color(256,0,0);
      for(int i=0;i<num;i++){
        colors[i] = color(256*(i+1)/num,0*(num-i)/num,0);
      }
      lights();
    }
    void draw(int x,int y,int wi,int hi){
    PGraphics pg = createGraphics(wi,hi,P3D);
      pg.noStroke();
      frameRate(24);
     pg.beginDraw();
      b += 0.02f;
      if(b>pg.TWO_PI){
        b = 0.0f;
      }
      pg.translate(width/2,height/2);
      pg.rotateX(b/4);
      pg.rotateY(b*2);
      pg.rect(-sSize,-sSize,sSize*2,sSize*2);
      pg.rotateX(b*1.001f);
      pg.rotateY(b*2.002f);
      pg.rect(-sSize,-sSize,sSize*2,sSize*2);
      pg.rotateX(b);
      pg.rotateY(b);
      pg.rect(-sSize,-sSize,-sSize,-sSize);

      pg.translate(0,0,16);
      pg.translate(width/2,height/2,-20);
      if(b>=pg.TWO_PI*2){
        b=0.0f;
      }
      for(int i=0;i<num;i++){
        pg.pushMatrix();
        pg.fill(colors[i]);
        pg.rotateY(b+offset*i);
        pg.rotateX(b/2+offset*i);
        pg.box(width/2);
        pg.popMatrix();
      }
      pg.endDraw();
      image(pg,x,y);
    }
  }

// Processingでキーの状態を管理するクラス
class Key {
  String name; // キーの名前
  char key; // keyの値
  int keyCode; // keyCodeの値
  boolean isPressed; // 押されているか否か

  // コンストラクタ
  Key(String tempName, char tempKey, int tempKeyCode) {
    name = tempName;
    key = tempKey;
    keyCode = tempKeyCode;
    isPressed = false;
  }

  // 引数で指定されたキーと一致するかどうかを判定
  boolean equals(char tempKey, int tempKeyCode) {
    if (tempKey != CODED) {
      if (key == tempKey) {
        return true;
      } else {
        return false;
      }
    } else {
      if (keyCode == tempKeyCode) {
        return true;
      } else {
        return false;
      }
    }
  }

  // 引数で指定されたキーが押された
  void pressed(char tempKey, int tempKeyCode) {
    if (equals(tempKey, tempKeyCode) == true) {
      isPressed = true;
    }
  }

  // 引数で指定されたキーが離された
  void released(char tempKey, int tempKeyCode) {
    if (equals(tempKey, tempKeyCode) == true) {
      isPressed = false;
    }
  }
  void shoot(){
    if(isPressed == true){
        stroke(255,255,255);
        line(ship.sx,ship.sy,ship.sx,0);      
    }
  }
  void plusX(){
    if(isPressed == true){
        ship.sx += 5;
    }else{
      isPressed = false;
    }
  }
  void minusX(){
    if(isPressed == true){
        ship.sx -= 5;      
    }else{
        isPressed = false;
    }
  }
  void plusY(){
    if(isPressed == true){
        ship.sy += 5;
    }else{
      isPressed = false;
    }
  }
  void minusY(){
    if(isPressed == true){
        ship.sy -= 5;      
    }else{
        isPressed = false;
    }
  }
}

class KeyController{
  Key upKey, downKey, leftKey, rightKey, xKey,zKey; // 使用するキー
  Key[] keys; // キーを入れる配列

  KeyController() {
    // 上下左右zキーを作る
    upKey    = new Key("UP",    (char)CODED, UP);
    downKey  = new Key("DOWN",  (char)CODED, DOWN);
    leftKey  = new Key("LEFT",  (char)CODED, LEFT);
    rightKey = new Key("RIGHT", (char)CODED, RIGHT);
    xKey   = new Key("X",   'x',         0);
    zKey   = new Key("Z",   'z',         1);

    // 作ったキーを登録する
    keys = new Key[6];
    keys[0] = upKey;
    keys[1] = downKey;
    keys[2] = leftKey;
    keys[3] = rightKey;
    keys[4] = xKey;
    keys[5] = zKey;
  }
  
  void pressed(char tempKey, int tempKeyCode) {
    // 全キーに引数で指定されたキーが押されたことを通知
    for (int i = 0; i < keys.length; i++) {
      keys[i].pressed(tempKey, tempKeyCode);
    }
  }

  // 引数で指定されたキーが押された
  void released(char tempKey, int tempKeyCode) {
    // 全キーに引数で指定されたキーが離されたことを通知
    for (int i = 0; i < keys.length; i++) {
      keys[i].released(tempKey, tempKeyCode);
    }
  }
  void button(){
    zKey.shoot();
    rightKey.plusX();
    leftKey.minusX();
    upKey.minusY();
    downKey.plusY();
  }
}
