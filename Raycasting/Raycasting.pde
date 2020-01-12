ArrayList<Boundary> bounds;
Light light;

void setup() {
  //size(800, 600);
  fullScreen();

  bounds = new ArrayList<Boundary>();
  for (int i = 0; i < 4; i++) {
    bounds.add(new Boundary(random(width), random(height), random(width), random(height)));
  }
  
  //Walls at the sides
  bounds.add(new Boundary(0, 0, width, 0));
  bounds.add(new Boundary(0, 0, 0, height));
  bounds.add(new Boundary(width, height, width, 0));
  bounds.add(new Boundary(width, height, 0, height));

  light = new Light(new PVector(width / 2, height / 2));
}

void draw() {
  background(0);

  for (Boundary b : bounds) {
    b.show();
  } 

  light.show();
  light.castLight(bounds);
}
