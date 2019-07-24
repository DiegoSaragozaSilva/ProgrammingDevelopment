class Mine
{
  int x, y, side, m, r, g, b;

  void create(int x, int y, int side)
  {
    this.x = x;
    this.y = y;
    this.side = side;
    //m = int(random(0, 2));
    r = 102;
    g = 101;
    b = 101;
  }

  void show()
  {
    fill(r, g, b);
    square(x, y, side);

    push();
    fill(255);
    translate(0, 40);
    rectMode(CENTER);
    text(m, x, y);
    pop();
  }
}
