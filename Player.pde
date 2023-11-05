class Player{
  float x,y,sz;
   
   Player(){
     x = 25;
     y = 25;
     sz = 50;
   }
  
  void show(){
    fill(255);
    circle(x,y,sz);
  }
  
  void move(){
    x = mouseX;
    y = mouseY;
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
  
  
  
 
}
