class Cube
{
  float x, y, v, l, xConstrain, m;

  Cube(float x, float m, float v, float l)
  {
    this.x = x;
    this.l = l;
    this.y = height - this.l - 1;
    this.m = m;
    this.v = v;
  }
  
  void setConstrain(float x) {
    xConstrain = x;
  }

  void update()
  {
    x += v;
  }
  
  void show()
  {
    fill(255);
    square(constrain(x, xConstrain, width), y, l);
  }
  
  boolean collide(Cube a)
  {
    float leftA = this.x;
    float rightA = this.x + this.l;
    float topA = this.y;
    float bottomA = this.y + this.l;

    float leftB = a.x;
    float rightB = a.x + a.l;
    float topB = a.y;
    float bottomB = a.y + a.l;

    return !(rightA < leftB  || leftA > rightB || bottomA < topB || topA > bottomB);
  }

  float bounce(Cube b)
  {
    float sumM = this.m + b.m;
    float finalv = ((this.m - b.m) / sumM) * this.v + ((2 * b.m /  sumM)) * b.v;
    return finalv;
  }
  
  boolean hitWall()
  {
    return (this.x <= 0);
  }
}
