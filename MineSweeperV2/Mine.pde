class Mine
{
  int i, j, side, x, y, m;
  
  Mine(int i, int j, int side)
  {
    this.i = i;
    this.j = j;
    this.side = side;
    x = i * side;
    y = j * side;
    //m = int(random(0, 2));
  }
  
  void show()
  {
    stroke(255);
    fill(0);
    square(x, y, side);

    push();
    fill(255);
    translate(0, 40);
    rectMode(CENTER);
    text(m, x + side / 2 - 3, y - side / 2 + 6);
    pop();
  }
  
  boolean isClicked()
  {
    if(mouseX >= x && mouseX <= x + side && mouseY >= y && mouseY <= y + side)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
}
