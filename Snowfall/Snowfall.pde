ArrayList <Snowflake> s = new ArrayList <Snowflake>();
float sx, sy;
float maxSF = 100;
float v;

void setup()
{
  size(800, 600);
  createSFS();
}


void draw()
{
  background(45);

  for (int i = 0; i < s.size(); i++)
  {
    s.get(i).show();
    s.get(i).fall();
    if (s.get(i).y > height)
    {
      s.get(i).y = -1;
      s.get(i).v = random(3, 7);
    }
  }
}

void createSFS()
{
  for (int i = 0; i < maxSF; i++)
  {
    sx = random(width);
    sy = random(-1, -10);
    v = random(4, 6);
    s.add(new Snowflake());
    s.get(i).create(sx, sy, v);
  }
}
