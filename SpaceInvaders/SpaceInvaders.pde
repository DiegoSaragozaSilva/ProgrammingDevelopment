Shooter s = new Shooter();
Alien a = new Alien();
ArrayList<Bullet> Bullets = new ArrayList<Bullet>();
ArrayList<Alien> Aliens = new ArrayList<Alien>(); 
float movspeed = 2.5;
int index = 0;
int m = millis();
int n = millis();
int pontos = 0;
float temp = 2000;

void setup() {
  size(600, 400);                                    
  s.create(width / 2, 380);
}

void draw() {
  background(15);                                    
  s.show();
  s.move();
  textAlign(RIGHT, CENTER);
  fill(255);
  textSize(10);
  text("Pontuação: " + pontos, width - 50, height - 50);
  if (millis() > m  + temp)
  {
    Aliens.add(new Alien());

    m = millis();
  }
  if (millis() > n + 10000)
  {
    if (temp > 800) {
      temp -= 100;
    } else
    {
      temp = 2000;
    }
    n = millis();
  }

  for (int x = 0; x < Bullets.size(); x++)           
  {
    Bullets.get(x).show();                           
    Bullets.get(x).move();
    for (int y = 0; y < Aliens.size(); y++) 
    {
      float d = dist(Bullets.get(x).x, Bullets.get(x).y, Aliens.get(y).x, Aliens.get(y).y);
      if (d < Bullets.get(x).r + Aliens.get(y).r / 2)
      {
        if (Aliens.get(y).remove == true)
        {
          Aliens.remove(y);
          Bullets.get(x).x = 5000;
          pontos++;
        } else
        {
          Aliens.get(y).hits();
        }
      }
    }
  }
  for (int x = 0; x < Aliens.size(); x++)           
  {
    Aliens.get(x).move();
    Aliens.get(x).show();
    float d = dist(s.x, s.y, Aliens.get(x).x, Aliens.get(x).y);
    if (d < (15 / 2) + (Aliens.get(x).r / 2))
    {
      textAlign(CENTER);
      fill(255);
      textSize(32);
      text("Você perdeu! Sua pontuação foi " + pontos, width / 2, height / 2);
      noLoop();
    }
  }
}

void keyPressed() {
  //key checking
  if (keyCode == RIGHT)
  {
    s.setDir(movspeed * -1);
  }
  if (keyCode == LEFT)
  {
    s.setDir(movspeed);
  }
  if (key == ' ')
  {
    Bullets.add(new Bullet());
    Bullets.get(index).create(s.x, s.y);
    index++;
  }
  if (keyCode == ENTER)
  {
    Bullets.clear();
    Aliens.clear();
    pontos = 0;
    loop();
  }
}

void keyReleased()
{
  if (key != ' ')
  {
    s.setDir(0);
  }
}
