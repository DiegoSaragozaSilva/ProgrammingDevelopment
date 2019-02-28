class Shooter{
  float x;
  float y;
  float movspeed; //movement speed of the shooter
  
  void create(float posx, float posy){
    x = posx;
    y = posy;
  }
  void show(){
    fill(255);
    rectMode(CENTER);
    rect(x,y,30,30);
  }
  
  void move(float dir){
    x -= dir;
  }
}
