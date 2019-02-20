//Riley Goodling
//Replicating the shaver on both sides of the sheep using instancing 

float time = 0;  // keep track of passing of time
float count = 0;
PImage bg;
PImage newbg;

void setup() {
  size(565, 565, P3D);  // must use 3D here !!!
  noStroke();           // do not draw the edges of polygons
  bg = loadImage("barn.png");
  newbg = loadImage("farm.jpg");
}
void draw() {
  resetMatrix();
  
  background(bg);
  // set up for perspective projection
  perspective (PI * 0.333, 1.0, 0.01, 1000.0);
  //place the camera in the scene (just like gluLookAt())
  float t = 30.0;
  //if (time <10) {
  //camera (-90, 0.0, 0.0, 0.0, 0.0, -1.0, 0.0, 1.0, 0.0);
  //}
  if (time < t) {
    camera (-90 + (3*time), 0.0, 25.0 + (2*time), 0.0, 0.0, -1.0, 0.0, 1.0, 0.0);
  } else {
    camera (0.0, 0.0, 85, 0.0, 0.0, -1.0, 0.0, 1.0, 0.0);
  }
  // create an ambient light source
  ambientLight (102, 102, 102);

  // create two directional light sources
  lightSpecular (204, 204, 204);
  directionalLight (102, 102, 102, -0.7, -0.7, -1);
  directionalLight (152, 152, 152, 5, 0, -1);
  
  //Body
  pushMatrix();
  body(1);
  popMatrix();
  
  pushMatrix();
  translate(0,0,14);
  shaver();
  popMatrix();
  
  pushMatrix();
  translate(0,0,-12);
  shaver();
  popMatrix();
  
  if(time == 6.480014 || time == 12.029988 || time == 18.51001 || time == 24.030136 || time == 30.540285 || time == 35.070194) {
    count = 0;
  } else {
    count += .03;
  }
  time += 0.03;
  
  if (frameCount > 1335) {
    background(newbg);
    body(0);
  }
}
