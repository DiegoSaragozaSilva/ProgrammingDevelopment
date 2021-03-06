class Pendulum
{
  float l1, l2, o1, o2, o1v, o2v, o1a, o2a, x1, y1, x2, y2, m1, m2, g;
  float px2, py2;
  ArrayList<PVector> history = new ArrayList<PVector>();

  void create(float o1, float o2, float l1, float l2)
  {

    this.l1 = l1;
    this.l2 = l2;
    this.o1 = o1;
    this.o2 = o2;
    m1 = 40;
    m2 = 40;
    g = 1;
  }

  void show()
  { 
    x1 = l1 * sin(o1);
    y1 = -l1 * cos(o1);
    x2 = x1 + l2 * sin(o2);
    y2 = y1 - l2 * cos(o2);     
  
    stroke(0);
    translate(width / 2, height / 2);
    strokeWeight(3);
    line(0, 0, x1, -y1);
    strokeWeight(1);
    fill(0);
    ellipse(x1, -y1, 25, 25);
    strokeWeight(3);
    line(x1, -y1, x2, -y2);
    strokeWeight(1);
    ellipse(x2, -y2, 25, 25);

    for (int i = 1; i < history.size(); i++)
    {
      if (frameCount > 1)
      {
        PVector p1 = history.get(i);
        PVector p2 = history.get(i - 1);
        strokeWeight(3);
        stroke(0, 255, 229, 100);
        line(p1.x, -p1.y, p2.x, -p2.y);
      }
    }
    PVector v = new PVector(x2, y2);
    
    if (history.size() >= 100)
    {
      history.add(v); 
      history = realocate(history);
    }
    else
    {
      history.add(v);
    }
    
  }

  void move()
  {
    accelerationC();
    o1v += o1a;
    o2v += o2a;
    o1 += o1v;
    o2 += o2v;
  }

  void accelerationC()
  {
    float num1 = -g * (2 * m1 + m2) * sin(o1);
    float num2 = -m2 * g * sin(o1 - 2 * o2);
    float num3 = -2 * sin(o1 - o2) * m2;
    float num4 = ((o2v * o2v) * l2 + (o1v * o1v) * l1 * cos(o1 - o2));
    float den = l1 * (2 * m1 + m2 - m2 * cos(2 * o1 - 2 * o2));
    o1a = (num1 + num2 + num3 + num4) / den;

    num1 =  2 * sin(o1 - o2);
    num2 = (o1v * o1v) * l1 * (m1 + m2);
    num3 = g * (m1 + m2) * cos(o1);
    num4 = (o2v * o2v) * l2 * m2 * cos(o1 - o2);
    den = l2 * (2 * m1 + m2 - m2 * cos(2 * o1 - 2 * o2));
    o2a = (num1 * (num2 + num3 + num4)) / den;
  }
  
  ArrayList realocate(ArrayList<PVector> al)
  {
    ArrayList<PVector> aux = new ArrayList<PVector>();
    for(int i = 1; i < al.size(); i++)
    {
      aux.add(al.get(i));
    }
    return aux;
  }
}
