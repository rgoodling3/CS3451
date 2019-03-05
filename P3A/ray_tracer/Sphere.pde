class Sphere extends Shape {
  PVector s;
  float radius;
  
  Sphere (float r, float x, float y, float z) {
    radius = r;
    s = new PVector(x,y,z);
  }
  
  PVector getCenter() {
    return s;
  }
  
  float getRadius() {
    return radius;
  }
  float checkInter(Ray r) {
    PVector direction = r.getdirection();
    PVector origin = r.getorigin();
    PVector center = s;
    
    float a = PVector.dot(direction, direction);
    PVector diff = PVector.sub(origin,center);
    float dot = PVector.dot(direction, diff);
    float b = 2 * dot;
    float c = PVector.dot(diff,diff) - (radius * radius);
    
    float det = (b*b) - 4*a*c;
    //System.out.println("Det"  + det);
    if (det > 0) {
      float t1 = (-b + sqrt(det))/(2*a);
      float t2 = (-b - sqrt(det))/(2*a);
      //System.out.println("T1" + t1);
      //System.out.println("T2" + t2);
      if (t1 < 0 && t2 < 0) {
        return -1;
      }
      else if (t1 < 0) {
        return t2;
      } else if (t2 < 0){
        return t1;
      } else {
        return min(t1,t2);
      }
    }
    return -1;
  }
  
  PVector getNormal(PVector hitpos) {
    PVector normal = PVector.sub(hitpos, s);
    return normal.normalize();
  }
}
