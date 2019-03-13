class Ray {
  PVector o;
  PVector d;
  
  Ray() {
    o = new PVector();
    d = new PVector();
  }
  
  void origin(float x, float y, float z) {
    o.set(x,y,z);
  }
  
  void direction(float x, float y, float z) {
    float dx = x;
    float dy = y;
    float dz = z;
    d.set(dx,dy,dz);
    d = d.normalize();
  }
  
  PVector getorigin() {
    return o;
  }
  PVector getdirection() {
    return d;
  }
}
