// 3D Scene Example

float time = 0;  // keep track of passing of time

void setup() {
  size(800, 800, P3D);  // must use 3D here !!!
  noStroke();           // do not draw the edges of polygons
}

// Draw a scene with a cylinder, a sphere and a box
void draw() {
  
  resetMatrix();  // set the transformation matrix to the identity (important!)

  background(146, 223, 105);  // clear the screen to black

  // set up for perspective projection
  perspective (PI * 0.333, 1.0, 0.01, 1000.0);

  // place the camera in the scene (just like gluLookAt())
  camera (0.0, 0.0, 85.0, 0.0, 0.0, -1.0, 0.0, 1.0, 0.0);
    
  // create an ambient light source
  ambientLight (102, 102, 102);

  // create two directional light sources
  lightSpecular (204, 204, 204);
  directionalLight (102, 102, 102, -0.7, -0.7, -1);
  directionalLight (152, 152, 152, 0, 0, -1);

  // Legs
  legs(-8, 8, -1); 
  legs(-6, 8, -3);
  legs(8, 8, -1);
  legs(6, 8, -3);

  //Tail
  pushMatrix();

  fill (15, 15, 15);
  ambient (50, 50, 50);
  specular (0, 0, 0);
  shininess (1.0);
  
  translate (17, 2, 0);
  sphereDetail (40);
  sphere (1);

  popMatrix();
  
  //Nose
  pushMatrix();

  fill (255, 153, 204);
  ambient (50, 50, 50);
  specular (0, 0, 0);
  shininess (1.0);
  
  scale(1.0, 1.0, 2.0);
  translate (-22, -1, -1);
  sphereDetail (40);
  sphere (1);

  popMatrix();
  
  //Ear
  
  pushMatrix();

  fill (15, 15, 15);
  ambient (50, 50, 50);
  specular (0, 0, 0);
  shininess (1.0);
  
  translate (-17, -7, 0);
  scale(1.0,1.8,1.0);
  sphereDetail (40);
  sphere (1);

  popMatrix();
  
  //Eye

  pushMatrix();

  fill (250, 250, 250);
  ambient (50, 50, 50);
  specular (0, 0, 0);
  shininess (1.0);
  
  translate (-19, -3, 1);
  sphere (1.5);

  popMatrix();
  
  //Pupil
  pushMatrix();

  fill (0, 0, 0);
  ambient (50, 50, 50);
  specular (0, 0, 0);
  shininess (1.0);
  
  translate (-18.4, -3, 4);
  sphere (.5);

  popMatrix();
  
  //Head

  pushMatrix();

  fill (15, 15, 15);
  ambient (50, 50, 50);
  specular (0, 0, 0);
  shininess (1.0);
  
  translate (-17, -1, -4);
  sphereDetail (40);
  sphere (6);

  popMatrix();
  
  //Body

  pushMatrix();

  fill (240, 240, 240);
  ambient (50, 50, 50);
  specular (0, 0, 0);
  shininess (1.0);

  translate (1, 0, 0);
  scale(1.2,1.0,1.0);
  sphereDetail (40);
  sphere (13);

  popMatrix();
  
  floof(0, 10, 8);
  floof(-3, -10, 8);
  floof(2, 0, 12);
  floof(-5, 4, 10);
  floof(8, 7, 8);
  floof(-7, -8, 8);
  floof(-1, -9, 8);
  floof(6, -6, 11);
  floof(-3, 0, 12);
  floof(5, -1, 11);
  floof(1, 8, 8);
  floof(-11, 6, 5);
  floof(-10, 4, 7);
  floof(-9, 0, 10);
  floof(-10, -4, 7);
  floof(4, 3, 12);
  floof(13, 4, 7);
  floof(12, -2, 7);
  floof(-3,-3,11);
  floof(10, -8, 7);
  floof(6, -9, 7);
  floof(0, -5, 10);
  floof(-6,9, 7);
  floof(-2, 4, 11);
  floof(8, 0, 11);
}

// Draw a cylinder of a given radius, height and number of sides.
// The base is on the y=0 plane, and it extends vertically in the y direction.
void cylinder (float radius, float height, int sides) {
  int i,ii;
  float []c = new float[sides];
  float []s = new float[sides];

  for (i = 0; i < sides; i++) {
    float theta = TWO_PI * i / (float) sides;
    c[i] = cos(theta);
    s[i] = sin(theta);
  }
  
  // bottom end cap
  
  normal (0.0, -1.0, 0.0);
  for (i = 0; i < sides; i++) {
    ii = (i+1) % sides;
    beginShape(TRIANGLES);
    vertex (c[ii] * radius, 0.0, s[ii] * radius);
    vertex (c[i] * radius, 0.0, s[i] * radius);
    vertex (0.0, 0.0, 0.0);
    endShape();
  }
  
  // top end cap

  normal (0.0, 1.0, 0.0);
  for (i = 0; i < sides; i++) {
    ii = (i+1) % sides;
    beginShape(TRIANGLES);
    vertex (c[ii] * radius, height, s[ii] * radius);
    vertex (c[i] * radius, height, s[i] * radius);
    vertex (0.0, height, 0.0);
    endShape();
  }
  
  // main body of cylinder
  for (i = 0; i < sides; i++) {
    ii = (i+1) % sides;
    beginShape();
    normal (c[i], 0.0, s[i]);
    vertex (c[i] * radius, 0.0, s[i] * radius);
    vertex (c[i] * radius, height, s[i] * radius);
    normal (c[ii], 0.0, s[ii]);
    vertex (c[ii] * radius, height, s[ii] * radius);
    vertex (c[ii] * radius, 0.0, s[ii] * radius);
    endShape(CLOSE);
  }
}

void floof (float x, float y, float z) {
  pushMatrix();

  fill (240, 240, 240);
  ambient (50, 50, 50);
  specular (0, 0, 0);
  shininess (1.0);
  
  translate (x, y, z);
  sphere (3);

  popMatrix(); 
}

void legs(float x, float y, float z) {
  pushMatrix();

  // diffuse (fill), ambient and specular material properties
  fill (15, 15, 15);       // "fill" sets both diffuse and ambient color (yuck!)
  ambient (50, 50, 50);      // set ambient color
  specular (0, 0, 0);   // set specular color
  shininess (5.0);            // set specular exponent

  translate (x,y,z);
  cylinder (1.0, 10.0, 32);

  popMatrix();
}
