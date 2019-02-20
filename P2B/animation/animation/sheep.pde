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

void floof (float x, float y, float z, float t, int multi) {
  pushMatrix();

  fill (240, 240, 240);
  ambient (50, 50, 50);
  specular (0, 0, 0);
  shininess (1.0);
  
  if(time < t) {
    translate (x, y, z);
  }
  else if (y+(multi *(time/t)) < 14.7) {
    translate (x,y+(multi *(time/t)),z);
  } else {
    translate(x, 15, z);
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

void body(int fur) {
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
  
  if (fur == 1) {
  //first line
  floof(-10,-10,0, 2.5, 5);  
  floof(-8, -8, -1, 3, 5);
  floof(-10, -4, 7, 3.5, 5);
  floof(-10, -4, -7, 3.5, 5);
  floof(-9, 0, -10, 4.2, 5);
  floof(-9, 0, 10, 4.2, 5);
  floof(-10, 4, 7, 5, 5);
  floof(-10, 4, -7, 5, 5);
  floof(-11, 6, -5, 5.2, 5);
  floof(-11, 6, 5, 5.2, 5);
  floof(-6,9, 7, 5.5, 5);
  floof(-6,9, -7, 5.5, 5);
  
  //second line
  floof(-3,-12,3, 14, 15);
  floof(-4,-11,2, 14.1, 15);
  floof(-5,-11,-2, 14.2, 15);
  floof(-3, -10, 8, 14.8, 15);
  floof(-3, -10, -8, 14.8, 15);
  floof(-1, -9, 8, 15.1, 15);
  floof(-1, -9, -8, 15.1, 15);
  floof(0, -5, -10, 15.3, 15);
  floof(-3,-3,-11, 16, 15);
  floof(-3,-3,11, 16, 15);
  floof(-3, 0, -12, 16.5, 15);
  floof(-3, 0, 12, 16.5, 15);
  floof(-5, 4, 10, 17, 15);
  floof(-2, 4, 11,17, 15);
  floof(-5, 4, -10, 17, 15);
  floof(-2, 4, -11, 17, 15);
  floof(0, 10, 8, 17, 15);
  
  //third line
floof(3,-12,-2,25.5, 10);
  floof(2,-12,1, 25.5, 10);
  floof(5,-11,2,26, 10);
  floof(0,-11,0,26, 10);
  floof(0, -5, 10,27, 10);
  floof(5, -1, 11,27.5, 10);
  floof(5, -1, -11,27.5, 10 );
  floof(2, 0, -12,28, 10);
  floof(2, 0, 12,28, 10);
  floof(4, 3, 12,28.5, 10);
  floof(4, 3, -12,28.5, 10);
  floof(1, 8, 8,29, 10);
  floof(1, 8, -8,29, 10);
  floof(0, 10, -8, 29.5, 10);

  //fouth line
  floof(10,-10, 0, 36, 15);
  floof(6, -9, 7, 36.2, 15);
  floof(6, -9, -7, 36.2, 15);
  floof(10, -8, 7, 36.5, 15);
  floof(10, -8, -7, 36.5, 15);
  floof(11, -7, 1, 36.8, 15);
  floof(6, -6, 11, 37, 15);
  floof(6, -6, -11,37, 15);
  floof(14, -5,-2, 37.2, 15);
  floof(14, -3,2, 37.5, 15);
  floof(12, -2, 7, 37.8, 15);
  floof(12, -2, -7,37.8, 15);
  floof(14, -2, 0,37.8, 15);
  floof(8, 0, 11, 38, 15);
  floof(8, 0, -11, 38, 15);
  floof(13, 4, 7, 38.5, 15);
  floof(13, 4, -7, 38.5, 15);
  floof(14, 5, 0, 38.8, 15);
  floof(8, 7, 8, 38.8, 15);
  floof(11, 7,-1, 38.8, 15);
  floof(8, 7, -8, 38.8, 15);
  floof(12, 8, 0, 40, 15);
  }
  
  //Tail
  tail();
  
  //Head
  pushMatrix();
  rotate(sin(time), 1.0, 0.0, 0.0);
  head();
  popMatrix();
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
