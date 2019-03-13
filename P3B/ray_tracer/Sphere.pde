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
  float[] checkInter(Ray r) {
    PVector direction = r.getdirection();
    PVector origin = r.getorigin();
    PVector center = s;
    float[] arr = new float[2];
    arr[1] = 0;
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
        arr[0] = -1;
        return arr;
      }
      else if (t1 < 0) {
        arr[0] = t2;
        return arr;
      } else if (t2 < 0){
        arr[0] =  t1;
        return arr;
      } else {
        arr[0] = min(t1,t2);
        return arr;
      }
    }
    arr[0] = -1;
    return arr;
  }
  
  PVector getNormal(float[] arr, Ray r) {
    PVector hitpos = new PVector(arr[0],arr[1],arr[2]);
    PVector normal = PVector.sub(hitpos, s);
    return normal.normalize();
  }
}
