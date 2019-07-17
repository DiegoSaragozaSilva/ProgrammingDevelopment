float o1, o2, l1, l2;
Pendulum dp;
void setup()
{
  size(500, 500);
  o1 = PI / 2;
  o2 = 0;
  l1 = 100;
  l2 = 100;
  dp = new Pendulum();
  dp.create(o1, o2, l1, l2);
}

void draw()
{
  background(255);
  dp.show();
  dp.move();
}
