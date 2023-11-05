import processing.sound.*;
SoundFile sound;
Ostacle[] ostacles = new Ostacle[100];
float[] dx = new float[100];
float[] dy = new float[100];
int cnt = 10;
int st, score;
Player p;
PImage img;
boolean isGame;

void setup() {
  size(1920, 1040);
  sound = new SoundFile(this,"backmusic.mp3");
  sound.loop();
  img = loadImage("./bg.jpg");
  img.resize(width, height);
  frameRate(60);
  for (int i = 0; i<100; i++) {
    ostacles[i] = new Ostacle();
  }
  p = new Player();
  st = millis();
  score = millis();
  isGame = true;
}

void draw() {
  background(img);
  //플레이어 움직이기
  p.show();
  p.move();

  //장애물 움직이기
  for (int i = 0; i<cnt; i++) {
    ostacles[i].show();
    ostacles[i].update();
  }
  //장애물 추가하기
  if ((millis() - st) > 3000) {
    cnt = cnt + 2;
    st = millis();
    for (int i = 0; i<cnt; i++) {
      ostacles[i].changeColor();
    }
  }


  //게임오버
  for (int i = 0; i<cnt; i++) {
    if (p.isCrash(ostacles[i])) {

      gameOver();
    }
  }
  /*
  for(int i = 0; i<cnt;i++){
   for(int j = i+1;j<cnt;j++){
   if(ostacles[i].isCrash(ostacles[j])){
   ostacles[i].exchange(ostacles[j]);
   }
   }
   }
   */
  Score();
}

void Score() {
  float cur = (millis() - score)/1000.0;
  fill(115, 115, 115,150);
  rectMode(CENTER);
  rect(width-170,35,300,50);
  fill(0,255,0);
  textSize(50);
  textAlign(CENTER);
  text("TIME: " + String.format("%.2f", cur)+"s", width-170, 50, 300);
}

void keyPressed() {
  if (keyCode == ENTER) {
    if (!isGame) {
      reStart();
    }
  }
}

void gameOver() {
  isGame = false;

  rectMode(CENTER);
  fill(0, 255, 0);
  rect(width/2, height/2, 1030, 230);

  fill(0);
  rect(width/2, height/2, 1000, 200);

  fill(0, 255, 0);
  textSize(180);
  textAlign(CENTER);
  text("GAME OVER", width/2, height/2+60);
  textSize(70);
  text("enter to restart", width/2, height/2+200);
  sound.stop();
  noLoop();
}

void reStart() {
  isGame = true;
  cnt = 10;
  for (int i = 0; i<100; i++) {
    ostacles[i] = new Ostacle();
  }
  p = new Player();
  st = millis();
  score = millis();
  sound.loop();
  loop();
}
