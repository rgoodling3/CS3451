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
  
  if(time < 3) {
    translate (x, y, z);
  }
  else {
    translate (-10,y+time,0);
  }
  
  sphere (4);

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

void body() {
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
  
  // Legs
  legs(-8, 8, 4); 
  legs(-8, 8, -4);
  legs(8, 8, 4);
  legs(8, 8, -4);
  
  //first line
  floof(-10,-10,0);
 //if (time < 2) {
 //   floof(-10,-10, 0);
 // }
 // else {
 //   fall(-10,-10,0);
 // } 
  
  //floof(-8, -8, -1);
  //floof(-10, -4, 7);
  //floof(-10, -4, -7);
  //floof(-9, 0, -10);
  //floof(-9, 0, 10);
  //floof(-10, 4, 7);
  //floof(-10, 4, -7);
  //floof(-11, 6, -5);
  //floof(-11, 6, 5);
  //floof(-6,9, 7);
  //floof(-6,9, -7);
  
  //second line
  //floof(-3,-12,3);
  //floof(-4,-11,2);
  //floof(-5,-11,-2);
  //floof(-3, -10, 8);
  //floof(-3, -10, -8);
  //floof(-1, -9, 8);
  //floof(-1, -9, -8);
  //floof(0, -5, -10);
  //floof(-3,-3,-11);
  //floof(-3,-3,11);
  //floof(-3, 0, -12);
  //floof(-3, 0, 12);
  //floof(-5, 4, 10);
  //floof(-2, 4, 11);
  //floof(-5, 4, -10);
  //floof(-2, 4, -11);
  //floof(0, 10, 8);
  
  //third line
  //floof(3,-12,-2);
  //floof(2,-12,1);
  //floof(5,-11,2);
  //floof(0,-11,0);
  //floof(0, -5, 10);
  //floof(5, -1, 11);
  //floof(5, -1, -11);
  //floof(2, 0, -12);
  //floof(2, 0, 12);
  //floof(4, 3, 12);
  //floof(4, 3, -12);
  //floof(1, 8, 8);
  //floof(1, 8, -8);
  //floof(0, 10, -8);

  //fouth line
  //floof(10,-10, 0);
  //floof(6, -9, 7);
  //floof(6, -9, -7);
  //floof(10, -8, 7);
  //floof(10, -8, -7);
  //floof(11, -7, 1);
  //floof(6, -6, 11);
  //floof(6, -6, -11);
  //floof(14, -5,-2);
  //floof(14, -3,2);
  //floof(12, -2, 7);
  //floof(12, -2, -7);
  //floof(14, -2, 0);
  //floof(8, 0, 11);
  //floof(8, 0, -11);
  //floof(13, 4, 7);
  //floof(13, 4, -7);
  //floof(14, 5, 0);
  //floof(8, 7, 8);
  //floof(11, 7,-1);
  //floof(8, 7, -8);
  //floof(12, 8, 0);
  
  //Tail
  tail();
  
  //Head
  head();
}

void nose() {
  pushMatrix();

  fill (255, 153, 204);
  ambient (50, 50, 50);
  specular (0, 0, 0);
  shininess (1.0);
  
  scale(1.0, 1.0, 2.0);
  translate (-22.2, -1, 0);
  sphereDetail (40);
  sphere (1);

  popMatrix();
}

void ear(float x, float y, float z, float bool) {
  pushMatrix();

  fill (15, 15, 15);
  ambient (50, 50, 50);
  specular (0, 0, 0);
  shininess (1.0);
  
  translate (x,y,z);
  if (bool == 0) {
    rotate(1,4,3,0);
  } else {
    rotate(1,-4,3,0);
  }
  scale(1.0,1.8,1.0);
  sphereDetail (40);
  sphere (1);

  popMatrix();
}

void head() {
  pushMatrix();

  fill (15, 15, 15);
  ambient (50, 50, 50);
  specular (0, 0, 0);
  shininess (1.0);
  

  translate (-17, -1, 0);

  sphereDetail (40);
  sphere (6);

  popMatrix(); 
  
  //Nose
  nose();
  
  //Ear
  
  ear(-17, -5, 5, 0);
  ear(-17, -5, -5, 1);
  
  //Eye
  eye(-21, -3, 3, -22.3, -3.2, 3.2);
  eye(-21, -3, -3, -22.3, -3.2, -3.2);
}

void eye(float x, float y, float z, float a, float b, float c) {
  //Eye

  pushMatrix();

  fill (250, 250, 250);
  ambient (50, 50, 50);
  specular (0, 0, 0);
  shininess (1.0);
  
  translate (x , y, z);
  sphere (1.5);

  popMatrix();
  
  pupil(a,b,c);
}

void pupil(float x, float y, float z) {
  //Pupil
  pushMatrix();

  fill (0, 0, 0);
  ambient (50, 50, 50);
  specular (0, 0, 0);
  shininess (1.0);
  
  translate (x,y,z);
  sphere (.5);

  popMatrix();
}

void tail() {
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
}
