import peasy.*;

PVector pos;
ArrayList<PVector> points;
float sigma, ro, beta, dT;
PeasyCam cam;

void setup() {
  size(800, 600, P3D);
  
  pos = new PVector();
  pos.x = 0;
  pos.y = 0.1;
  pos.z = 0;

  points = new ArrayList<PVector>();

  sigma = 10;
  ro = 28;
  beta = 8 / 3;

  dT = 0.01;

  cam = new PeasyCam(this, 500);
}

void draw() {
  background(0);
  
  double dxdt = sigma * (pos.y - pos.x);
  double dydt = pos.x * (ro - pos.z) - pos.y;
  double dzdt = pos.x * pos.y - beta * pos.z;

  pos.x += dxdt * dT;
  pos.y += dydt * dT;
  pos.z += dzdt * dT;

  points.add(new PVector(pos.x, pos.y, pos.z));

  stroke(255);
  strokeWeight(0.2);
  noFill();
  scale(4);
  
  beginShape();
  for (PVector p : points) {
    vertex(p.x, p.y, p.z);
  }
  endShape();
}
