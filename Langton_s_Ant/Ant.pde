class Ant {
  int x = 0, y = 0, dir = 0;

  void create(int x, int y)
  {
    this.x = x;
    this.y = y;
  }

  void show()
  {
    stroke(255, 0, 0);
    fill(255, 0, 0);
    point(x, y);
  }

  void moveWhite(int dir)
  {
    this.dir += dir;
    
    if (this.dir == 4) this.dir = 0;

    if (this.dir == 0) //UP
    {
      this.y -= 1;
    } else if (this.dir == 1) //RIGHT
    {
      this.x += 1;
    } else if (this.dir == 2) //DOWN
    {
      this.y += 1;
    } else if (this.dir == 3) //LEFT
    {
      this.x -= 1;
    }
  }
  
  
  void moveBlack(int dir)
  {
    this.dir += dir;
    
    if (this.dir == 4) this.dir = 0;

    if (this.dir == 0) //UP
    {
      this.y -= 1;
    } else if (this.dir == 3) //RIGHT
    {
      this.x += 1;
    } else if (this.dir == 2) //DOWN
    {
      this.y += 1;
    } else if (this.dir == 1) //LEFT
    {
      this.x -= 1;
    }
  }
}
