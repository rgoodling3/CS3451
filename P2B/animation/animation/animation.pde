float time = 0;  // keep track of passing of time

void setup() {
  size(800, 800, P3D);  // must use 3D here !!!
  noStroke();           // do not draw the edges of polygons
}
void draw() {
  resetMatrix();
  background(146, 223, 105);
  // set up for perspective projection
  perspective (PI * 0.333, 1.0, 0.01, 1000.0);
  //place the camera in the scene (just like gluLookAt())
  float t = 30.0;
  if (time < t) {
    camera (0.0 - (3*time), 0.0, 85.0 - (2*time), 0.0, 0.0, -1.0, 0.0, 1.0, 0.0);
  } else {
    camera (-t*3.0, 0.0, 85 - (2*t), 0.0, 0.0, -1.0, 0.0, 1.0, 0.0);
  }
  // create an ambient light source
  ambientLight (102, 102, 102);

  // create two directional light sources
  lightSpecular (204, 204, 204);
  directionalLight (102, 102, 102, -0.7, -0.7, -1);
  directionalLight (152, 152, 152, 0, 0, -1);
  
  //Body
  pushMatrix();
  body();
  popMatrix();
  
  pushMatrix();
  shaver();
  popMatrix();

  time += 0.03;
}
