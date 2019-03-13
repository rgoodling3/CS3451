class Cone extends Shape {
  PVector s;
  float h;
  float k;
  float x_normal;
  float z_normal;
  
  Cone (float x, float y, float z, float h1, float k1) {
    h = h1;
    k = k1;
    s = new PVector(x,y,z);
  }
  
  float[] checkInter(Ray r) {
    PVector direction = r.getdirection();
    PVector origin = r.getorigin();
    PVector center = s;
    
    float xnot = origin.x;
    float ynot = origin.y;
    float znot = origin.z;
    float dx = direction.x;
    float dy = direction.y;
    float dz = direction.z;
   
    float a = (dx)*(dx) + (dz)*(dz) - (dy)*(dy)*(k)*(k);
    float b = 2*(xnot)*(dx) + 2*znot*dz - 2*ynot*dy*k*k - 2*dx*center.x - 2*dz*center.z + k*k*2*dy*center.y;
    float c = xnot*xnot + znot*znot - k*k*ynot*ynot - 2*xnot*center.x - 2*znot*center.z + 2*k*k*ynot*center.y + center.x*center.x + center.z*center.z - k*k*center.y*center.y;
    
    float[] arr = new float[2];
    float det = (b*b) - 4*a*c;
    if (det > 0) {
      float t1 = (-b + sqrt(det))/(2*a);
      float t2 = (-b - sqrt(det))/(2*a);
      float t3 = (center.y + h - ynot)/dy;
      float t3x = origin.x + dx*t3;
      float t3z = origin.z + dz*t3;
      if (t1 < 0 && t2 < 0) {
        if ((t3x-center.x)*(t3x-center.x) + (t3z-center.z)*(t3z-center.z) < k*k*h*h){
          arr[0] = t3;
          arr[1] = 1;
          return arr;
        }
        arr[0] = -1;
        return arr;
      }
      else if (t1 < 0) {
        float y2 = ynot + dy*t2;
        if (y2 > center.y + h || y2 < center.y) {
          if ((t3x-center.x)*(t3x-center.x) + (t3z-center.z)*(t3z-center.z) < k*k*h*h){
            arr[0] = t3;
            arr[1] = 1;
            return arr;
          }
          arr[0] = -1;
          return arr;
        }
        if ((t3x-center.x)*(t3x-center.x) + (t3z-center.z)*(t3z-center.z) < k*k*h*h){
          if (min(t2,t3) == t3) {
            arr[0] = t3;
            arr[1] = 1;
            return arr;
          }
          arr[0] = min(t2,t3);
          return arr;
        }
        arr[0] = t2;
        return arr;
      } else if (t2 < 0){
        float y1 = ynot + dy*t1;
        if (y1 > center.y + h || y1 < center.y) {
          if ((t3x-center.x)*(t3x-center.x) + (t3z-center.z)*(t3z-center.z) < k*k*h*h){
            arr[0] = t3;
            arr[1] = 1;
            return arr;
          }
          arr[0] = -1;
          return arr;
        }
        if ((t3x-center.x)*(t3x-center.x) + (t3z-center.z)*(t3z-center.z) < k*k*h*h){
          if (min(t1,t3) == t3) {
            arr[0] = t3;
            arr[1] = 1;
            return arr;
          }  
          arr[0] = min(t1,t3);
          return arr;
        }
        arr[0] = t1;
        return arr;
      } else{
        float y1 = ynot + dy*t1;
        float y2 = ynot + dy*t2;
        if (y1 > center.y + h || y1 < center.y) {
          if ((t3x-center.x)*(t3x-center.x) + (t3z-center.z)*(t3z-center.z) < k*k*h*h){
            arr[0] = min(t2,t3);
            if(arr[0] == t3) {
              arr[1] = 1;
            }
            return arr;
          }
          arr[0] = -1;
          return arr;
        }
        if (y2 > center.y + h || y2 < center.y) {
          if ((t3x-center.x)*(t3x-center.x) + (t3z-center.z)*(t3z-center.z) < k*k*h*h){
            arr[0] = min(t1,t3);
            if(arr[0] == t3) {
              arr[1] = 1;
            }
            
            return arr;
          }
          arr[0] = -1;
          return arr;
        } else {
          if ((t3x-center.x)*(t3x-center.x) + (t3z-center.z)*(t3z-center.z) < k*k*h*h){
            if (min(t1,t2,t3) == t3) {
              arr[0] = t3;
              arr[1] = 1;
            } 
            arr[0] = min(t1,t2,t3);
            return arr;
          }
          arr[0] = min(t1,t2);
          return arr;
        }
      }
    }
    arr[0] = -1;
    return arr;
  }
  
  PVector getNormal(float[] arr, Ray r) { //also take in bool
    //t3 is the normal if arr[4] == 1
    if (arr[4] == 1) {
      PVector normal = new PVector(0,1,0);
      return normal;
    }
    PVector direction = r.getdirection();
    PVector origin = r.getorigin();
    
    float xnot = origin.x;
    float ynot = origin.y;
    float znot = origin.z;
    float dx = direction.x;
    float dy = direction.y;
    float dz = direction.z;
    
    float x = xnot + dx*arr[3];
    float z = znot + dz*arr[3];
    float y = ynot + dy*arr[3];
    float xb = s.x;
    float zb = s.z;
    PVector norm = new PVector(x - xb, -y/k, z-zb);
    return norm.normalize();
  }
  PVector getCenter() {
    return s;
  }
  float getRadius(){
    return h;
  }
}
