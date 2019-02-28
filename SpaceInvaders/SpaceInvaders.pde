Shooter s = new Shooter();                           
ArrayList<Bullet> Bullets = new ArrayList<Bullet>(); 
float movspeed = 2.5;
int index = 0;

void setup() {
  size(600, 400);                                    
  s.create(width / 2, 380);                          
}

void draw() {
  background(15);                                    
  s.show();                                          
  for (int x = 0; x < Bullets.size(); x++)           
  {
    Bullets.get(x).show();                           
    Bullets.get(x).move();                           
  }
}

void keyPressed() {
  //key checking
  if (keyCode == RIGHT)
  {
    s.move(movspeed * -1);
  }
  if (keyCode == LEFT)
  {
    s.move(movspeed);
  }

  if (key == ' ')
  {
    Bullets.add(new Bullet());
    Bullets.get(index).create(s.x, s.y);
    index++;
  }
}
