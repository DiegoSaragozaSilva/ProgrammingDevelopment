int[][] grid;
Ant a;
int oldX, oldY;

void setup()
{
  frameRate(240);
  size(200, 200);
  grid = new int[width][height];

  a = new Ant();
  a.create(width / 2, height / 2);
  a.move(0);
}

void draw()
{
  background(255); 

    if (grid[a.x][a.y] == 0)
    {
      oldX = a.x;
      oldY = a.y;

      a.move(1);
      grid[oldX][oldY] = 1; 
      stroke(255);
    } else if (grid[a.x][a.y] == 1)
    {
      oldX = a.x;
      oldY = a.y;

      a.move(-1);
      grid[oldX][oldY] = 0; 
      stroke(0);
    }

    for (int i = 0; i < width; i++)
    {
      for (int j = 0; j < height; j++)
      {
        if (grid[i][j] == 0)
        {
          stroke(255);
          point(i, j);
        } else if (grid[i][j] == 1)
        {
          stroke(0);
          point(i, j);
        }
      }
    }
    a.show();
  }
