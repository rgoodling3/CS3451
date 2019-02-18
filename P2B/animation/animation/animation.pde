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
  if (time < 18.0) {
    camera (0.0 - (time * 4), 0.0, 85.0 - (time * 4), 0.0, 0.0, -1.0, 0.0, 1.0, 0.0);
  } else {
    camera (-72, 0.0, 13, 0.0, 0.0, -1.0, 0.0, 1.0, 0.0);
  }
  // create an ambient light source
  ambientLight (102, 102, 102);

  // create two directional light sources
  lightSpecular (204, 204, 204);
  directionalLight (102, 102, 102, -0.7, -0.7, -1);
  directionalLight (152, 152, 152, 0, 0, -1);
  
  //Body
  pushMatrix();
  //rotate (time, 0.0, 1.0, 0.0);
  body();
  popMatrix();

  time += 0.03;
}

void fall(float x, float y, float z) {
  for(float count = y; count < 10 - y; count++){
    floof(x,count, z);
  }
}
