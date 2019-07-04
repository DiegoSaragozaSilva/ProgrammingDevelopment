float x, y, pi;
int circleP, n;
void setup()
{
  size(500, 500);
  background(0);
}

void draw()
{
  noFill();
  strokeWeight(1);
  stroke(255);
  square(0, 0, 500);
  circle(height / 2, width / 2, 500);
  for (int i = 0; i < 10000; i++)
  {
    strokeWeight(3);
    x = random(0, 500);
    y = random(0, 500);
    n++; 
    if (dist(x, y, height / 2, width / 2) <= 250)
    {  
      push();
      stroke(0, 250, 4);
      point(x, y);
      circleP++;
      pop();
    } else
    {
      push();
      stroke(0, 98, 255);
      point(x, y);
      pop();
    }
    pi = (float(circleP) / float(n)) * 4;
  }
  println(pi);
}
