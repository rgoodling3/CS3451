class Surface {
  float[] surface;
  Surface(float Cdr, float Cdg, float Cdb, float Car, float Cag, float Cab, float Csr, float Csg,
  float Csb, float P, float K) {
    surface = new float[11];
    surface[0] = Cdr;
    surface[1] = Cdg;
    surface[2] = Cdb;
    surface[3] = Car;
    surface[4] = Cag;
    surface[5] = Cab;
    surface[6] = Csr;
    surface[7] = Csg;
    surface[8] = Csb;
    surface[9] = P;
    surface[10] = K;
  }
  
  float getCdr() {
    return surface[0];
  }
  float getCdg() {
    return surface[1];
  }
  float getCdb() {
    return surface[2];
  }
  float getCar() {
    return surface[3];
  }
  float getCag() {
    return surface[4];
  }
  float getCab() {
    return surface[5];
  }
    float getCsr() {
    return surface[6];
  }
  float getCsg() {
    return surface[7];
  }
  float getCsb() {
    return surface[8];
  }
  float getP() {
    return surface[9];
  }
  float getK() {
    return surface[10];
  }
}
