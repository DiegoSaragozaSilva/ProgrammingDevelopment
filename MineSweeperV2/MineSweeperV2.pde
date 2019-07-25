Mine[][]Mines;
int rows, cols, x, y ,side, n;

void setup()
{
  size(401, 401);
  
  n = 5;
  rows = 10;
  cols = 10;
  side = 40;
  
  Mines = new Mine[cols][rows];
  
  for(int i = 0; i < rows; i++)
  {
    for(int j = 0; j < cols; j++)
    {
      Mines[i][j] = new Mine(i, j, side);
    }
  }
  
  for(int i = 0; i < n; i++)
  {
    Mines[int(random(0, cols))][int(random(0, rows))].m = 1;
  }
}



void draw()
{
  background(0);
  
  for(int i = 0; i < rows; i++)
  {
    for(int j = 0; j < cols; j++)
    {
      Mines[i][j].show();
    }
  }
}

void mouseClicked()
{
  for(int i = 0; i < rows; i++)
  {
    for(int j = 0; j < cols; j++)
    {
      if(Mines[i][j].isClicked())
      {
        if(Mines[i][j].m == 0)
        {
          println("WIN");
        }
        else if(Mines[i][j].m == 1)
        {
          println("LOSE");
        }
      }
    }
  }
}
