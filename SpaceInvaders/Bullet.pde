class Bullet {
  float x;
  float y;
  float r = 2.5;

  void create(float posx, float posy) {
    x = posx;
    y = posy;
  }
  void show() {
    noStroke(); 
    fill(0, 0, 204);
    ellipse(x, y, r * 2, r * 2);
  }
  void move() {
    y -= 5;
  }
}
