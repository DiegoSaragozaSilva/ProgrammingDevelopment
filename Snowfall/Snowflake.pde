class Snowflake {

  float r = 5;
  float x, y, v;
  void create(float x, float y, float v)
  {
    this.x = x;
    this.y = y;
    this.v = v;
  }
  
  void show()
  {
    fill(255);
    stroke(255);
    ellipse (x, y, 5, 5);
  }
  
   void fall()
   {
     y += v;
   }
}
