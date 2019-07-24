int side, h, n;
int grid[][] = new int[10][10];
ArrayList<Mine> Mines;
boolean b;

void setup()
{
  size(400, 400);
  side = 40;
  n = 20;
  b = true;
  Mines = new ArrayList<Mine>();

  for (int i = 0; i < width; i++)
  {
    for (int j = 0; j < height; j++)
    {
      if ( i == 0 && j == 0 || i % side == 0 && j % side == 0)
      {
        Mines.add(new Mine());
        Mines.get(h).create(i, j, side);
        h++;
      }
    }
  }

  for (int i = 0; i < n; i++)
  {
    Mines.get(int(random(0, h + 1))).m = 1;
  }

  for (int i = 0; i < Mines.size(); i++)
  {
    for (int j = 0; j < Mines.size(); j++)
    {
      if (h < 10)
      {
        grid[i][j] = Mines.get(h).m;
        println(grid[i][j]);
        h++;
      }
    }
  }
}

void draw()
{

  background(255);
  drawMines();
}

void drawMines()
{
  for (int i = 0; i < Mines.size(); i++)
  {
    Mines.get(i).show();
  }
}

void mouseClicked()
{
  if (b) 
  {
    for (int i = 0; i < Mines.size(); i++)
    {
      if (mouseX >= Mines.get(i).x && mouseX <= Mines.get(i).x + side && mouseY >= Mines.get(i).y && mouseY <= Mines.get(i).y + side)
      {
        if (Mines.get(i).m == 0)
        {
          Mines.get(i).r = 255;
          Mines.get(i).g = 255;
          Mines.get(i).b = 255;
        } else if (Mines.get(i).m == 1)
        {
          gameOver();
        }
      }
    }
  }
}


void gameOver()
{
  for (int i = 0; i < Mines.size(); i++)
  {
    if (Mines.get(i).m == 1)
    {
      Mines.get(i).r = 255;
      Mines.get(i).g = 0;
      Mines.get(i).b = 0;
    }
  } 
  b = false;
}
