abstract class Shape {
  Surface shape;
  
  void surface(Surface s) {
    shape = s;
  }
  
  abstract float checkInter(Ray r);
  abstract PVector getNormal(PVector hitpos);
  abstract PVector getCenter();
  abstract float getRadius();
  
  Surface getSurface() {
    return shape;
  }
}
