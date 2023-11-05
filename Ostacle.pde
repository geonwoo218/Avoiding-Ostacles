class Ostacle{
  float x,y,sz = 80;
  float dx,dy;
  color c;
  float ld,rd;
  
  float getX(){return x;}
  float getY(){return y;}
  float getSz(){return sz;}
  void setX(float xx){this.x = xx;}
  void setY(float yy){this.y = yy;}
  
  Ostacle(){
    x = random(sz/2, width-sz/2);
    y = random(sz/2, height-sz/2);
    dx = random(0,10);
    dy = random(0,10);
    sz = random(40,100);
    c = color(random(255),random(255),random(255));

}
  
  void show() {
   fill(c);
   circle(x, y, sz);
   fill(255);
   circle(x-sz/4, y-sz/5, sz/4); 
   circle(x+sz/4, y-sz/5, sz/4);
   fill(0);
   circle(x-sz/4, y-sz/5, sz/8); 
   circle(x+sz/4, y-sz/5, sz/8);
   fill(255, 143, 143);
   ellipse(x,y+sz/5,sz/7,sz/4);
  }
  
  void update(){
    x = x+dx;
    y = y+dy;
    
    if ( x-sz/2<0 ||x+sz/2>width) dx = -dx;
    if (y-sz/2<0 ||y+sz/2>height) dy = -dy;
  }
  
  boolean isCrash(Ostacle o){
    float xlen = abs(o.getX() - this.x);
    float ylen = abs(o.getY() - this.y);
    float szlen = abs(o.getSz()/2 + this.sz/2);
    
    if((szlen * szlen) >= (xlen*xlen) + (ylen*ylen)){
      return true;
    }
    return false;
  }
  
  void changeColor(){
    c = color(random(255),random(255),random(255));
    show();
  }
  void exchange(Ostacle o){
    float tempX = this.x;
    float tempY = this.y;
    o.setX(tempX);
    o.setY(tempY);
    this.x = o.getX();
    this.y = o.getY();
    
  }
}
