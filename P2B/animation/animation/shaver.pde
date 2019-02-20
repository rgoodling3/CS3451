void shaver() {
  if(time < 6.51) {
    //Down first row
    translate (-9, -15 + (4*count), 0);
  } else if(time < 12.03) {
    //Diagonal from one to two
    translate(-9 + (1.23*count), 10.92 - (4.8 * count), 0);
  } else if(time < 18.54) {
    //Down second row
    translate (-2, -15 + (4*count), 0);
  } else if (time < 24.06) {
    //Diagonal from two to three
    translate(-2 + (1.23*count), 10.92 - (4.8 * count), 0);
  } else if (time < 30.56) {
    //Down thrid row
    translate (5, -15 + (4*count), 0);
  } else if (time < 35.09) {
    //Diagonal from three to four
    translate(5 + (1.23*count), 10.92 - (4.8 * count), 0);
  } else if (time < 40) {
    //Fourth row down 
    translate (10.535, -10.68 + (4*count), 0);
  }
  razerbody();
  popMatrix();
}

void razerbody() {
  pushMatrix();
  pushMatrix();
  fill (200, 60, 60);       // "fill" sets both diffuse and ambient color (yuck!)
  ambient (50, 50, 50);      // set ambient color
  specular (200, 65, 65);   // set specular color
  shininess (1.0);            // set specular exponent
  
  scale(1.0,1.8,.8);
  box(2);
  razerblades();
  popMatrix();
  
}

void razerblades() {
  fill(200,200,200);
  ambient (50, 50, 50);      // set ambient color
  specular (150, 150, 150);   // set specular color
  shininess (5.0);           // set specular exponent
  pushMatrix();
  translate(0, -1, 0);
  scale(0.2, 1.0,1.0);
  box(1);
  popMatrix();
  pushMatrix();
  translate(-.9, -1, 0);
  scale(0.2, 1.0,1.0);
  box(1);
  popMatrix();
  pushMatrix();
  translate(-.45, -1, 0);
  scale(0.2, 1.0,1.0);
  box(1);
  popMatrix();
  pushMatrix();
  translate(.9, -1, 0);
  scale(0.2, 1.0,1.0);
  box(1);
  popMatrix();
  pushMatrix();
  translate(.45, -1, 0);
  scale(0.2, 1.0,1.0);
  box(1);
  popMatrix();
}
