float a = PI / 8;
float len = 120;
float r = 254, g = 255, b = 255;
float s = 0.67;

void setup()
{
  size(800, 600);
}


void draw()
{
  translate(width / 2, height);
  background(45);
  stroke(r, g, b);
  //changeColor();
  branch(len);
}


void branch(float len)
{
  line(0, 0, 0, -len);
  translate(0, -len);
  if (len > 4)
  {
    push();
    rotate(a);
    line(0, 0, 0, -len);
    branch(len * 0.75);
    pop();
    push();
    rotate(-a);
    line(0, 0, 0, -len);
    branch(len * 0.75);
    pop();
  }
}

void changeColor()
{
  if (r <= 1 && g <= 1 && b <= 1)
  {
    s += 1;
  } else if ( r >= 255 && g >= 255  && b >= 255)
  {
    s -= 1;
  } 
  r *= s;
  g *= s;
  b *= s;
}

void keyPressed()
{
  if (keyCode == UP)
  {
    a += 0.001;
  }
  if (keyCode == DOWN)
  {
    a -= 0.001;
  }
}
