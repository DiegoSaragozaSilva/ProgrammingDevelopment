int[][] grid;
Ant a;

void setup()
{
  frameRate(1);

  size(200, 200);
  grid = new int[width][height];

  a = new Ant();
  a.create(width / 2, height / 2);
}

void draw()
{
  background(255); 
  a.show(); 

  for (int i = 0; i < width; i++)
  {
    for (int j = 0; j < height; j++)
    {
      if (grid[i][j] == 1)
      {
        stroke(0);
        point(i, j);
      } else if (grid[i][j] == 0)
      {
        stroke(255);
        point(i, j);
      }
    }
  }

  if (grid[a.x][a.y] == 1)
  {
    a.moveWhite(1);
    grid[a.x][a.y] = 0; 
    stroke(0, 0, 0); 
  } else if (grid[a.x][a.y] == 0)
  {
    a.moveBlack(1);
    grid[a.x][a.y] = 1; 
    stroke(255); 
  }

  println(grid[a.x][a.y]);
}
