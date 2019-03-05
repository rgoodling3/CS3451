class Light{
  float[] light = new float[6];
  Light(float x, float y, float z, float r, float g, float b){
    light = new float[6];
    light[0] = x;
    light[1] = y;
    light[2] = z;
    light[3] = r;
    light[4] = g;
    light[5] = b;
  }
  
  PVector getlightpos() {
    PVector lightpos = new PVector();
    lightpos.set(light[0],light[1],light[2]);
    return lightpos;
  }
  
  float[] getRGB() {
    float[] colors = {light[3], light[4], light[5]};
    return colors;
  }
}
