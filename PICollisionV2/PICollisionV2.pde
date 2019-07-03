import processing.sound.*;

Cube a, b;
float x1, v1, l1, x2, v2, l2;
float m1, m2;
int pow, counter, timeSteps;
SoundFile clack; 

void setup()
{
  size(400, 200);
  frameRate(60);
  pow = 6;
  timeSteps = 100000;
  x1 = 80;
  x2 = 120;
  v1 = 0;
  v2 = -1;
  l1 = 10;
  l2 = 50;
  m1 = 1;
  m2 = pow(100, pow);
  a = new Cube(x1, m1, v1, l1);
  b = new Cube(x2, m2, v2 / timeSteps, l2);
  a.setConstrain(0);
  b.setConstrain(a.l);
  clack = new SoundFile(this, "clack.wav");
}


void draw()
{
  for (int i = 0; i < timeSteps; i++)
  {
    if (a.collide(b))
    { 
      float va = a.bounce(b);
      float vb = b.bounce(a);
      a.v = va;
      b.v = vb;
      counter++;
      clack.play(1);
    }

    if (a.hitWall())
    {
      a.v *= -1;
      counter++;
      clack.play(1);
    }
    a.update();
    b.update();
  }
  background(0);
  text(nf(counter, pow - 1), 10, 40);
  a.show();
  b.show();
  println(counter);
}
