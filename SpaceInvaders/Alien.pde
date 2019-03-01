class Alien {
  float x = 0;
  float y = 0;
  float r = 50;
  float movspeed;
  float xdir = 1.75;
  float ydir = 50;
  boolean left = false;
  boolean right = true;
  int bcounter = 0;
  boolean remove = false;
  int red = 70, green = 0, blue = 255;

  void create(float posx, float posy) {
    x = posx;
    y = posy;
  }
  void show() {
    fill(red, green, blue);
    rectMode(CENTER);
    rect(x, y, r, r);
  }

  void move() {
    if ( x >= width)
    {
      right = false;
      left = true;
      y += ydir;
    }
    if (x <= 0)
    {
      left = false;
      right = true;
      y += ydir;
    }

    if (right)
    {
      x += xdir;
    } else if (left)
    {
      x -= xdir;
    }
  }

  void hits()
  {
    if (bcounter == 25)
    {
      remove = true;
    } else {
      red += 3;
      green += 3;
      blue -= 3;
      bcounter++;
    }
  }
}
