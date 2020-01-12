class Light {

  PVector pos;
  ArrayList<Ray> rays;
  Light(PVector pos) {
    this.pos = pos;
    rays = new ArrayList<Ray>();
    for (int i = 0; i < 360; i += 10) {
      rays.add(new Ray(pos.x, pos.y, radians(i)));
    }
  }

  void show() {
    for (Ray r : rays) {
      pos.x = mouseX;
      pos.y = mouseY;
      r.move(pos);
      r.show();
    }
  }

  void castLight(ArrayList<Boundary> bounds) {
    for (Ray r : rays) {
      float recordDistance = 1000000000;
      PVector recordPos = new PVector();
      for (Boundary b : bounds) {
        PVector pt = r.cast(b);

        if (pt != null) {
          float d = dist(r.pos.x, r.pos.y, pt.x, pt.y);

          if (d < recordDistance) {
            recordDistance = d;
            recordPos = pt;
          }
        }
      }
      if (recordPos != null) {
        line(r.pos.x, r.pos.y, recordPos.x, recordPos.y);
      }
    }
  }
}
