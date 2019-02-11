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

  pushMatrix();

  // diffuse (fill), ambient and specular material properties
  fill (15, 15, 15);       // "fill" sets both diffuse and ambient color (yuck!)
  ambient (50, 50, 50);      // set ambient color
  specular (0, 0, 0);   // set specular color
  shininess (5.0);            // set specular exponent

  translate (-8, 8, -1);
  cylinder (1.0, 10.0, 32);

  popMatrix();
  
  pushMatrix();

  // diffuse (fill), ambient and specular material properties
  fill (15, 15, 15);       // "fill" sets both diffuse and ambient color (yuck!)
  ambient (50, 50, 50);      // set ambient color
  specular (0, 0, 0);   // set specular color
  shininess (5.0);            // set specular exponent

  translate (-6, 8, -3);
  cylinder (1.0, 10.0, 32);

  popMatrix();
  
    pushMatrix();

  // diffuse (fill), ambient and specular material properties
  fill (15, 15, 15);       // "fill" sets both diffuse and ambient color (yuck!)
  ambient (50, 50, 50);      // set ambient color
  specular (0, 0, 0);   // set specular color
  shininess (5.0);            // set specular exponent

  translate (8, 8, -1);
  cylinder (1.0, 10.0, 32);

  popMatrix();
  
    pushMatrix();

  // diffuse (fill), ambient and specular material properties
  fill (15, 15, 15);       // "fill" sets both diffuse and ambient color (yuck!)
  ambient (50, 50, 50);      // set ambient color
  specular (0, 0, 0);   // set specular color
  shininess (5.0);            // set specular exponent

  translate (6, 8, -3);
  cylinder (1.0, 10.0, 32);

  popMatrix();
  
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
  

  
  // Draw a sphere
  
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
  
  // Draw a box

  //pushMatrix();

  //fill (100, 100, 200);
  //ambient (100, 100, 200);
  //specular (0, 0, 0);
  //shininess (1.0);

  //translate (30, 0, 0);
  //rotate (-time, 1.0, 0.0, 0.0);      // rotate based on "time"
  //box (20);

  //popMatrix();

  // step forward in time
  //time += 0.03;
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
