void shaver() {
  pushMatrix();
  fill (200, 60, 60);       // "fill" sets both diffuse and ambient color (yuck!)
  ambient (50, 50, 50);      // set ambient color
  specular (200, 65, 65);   // set specular color
  shininess (1.0);            // set specular exponent
  
  if(time < 6.5) {
    translate (-9, -15 + (4*time), 14);
  } else if(time < 11.0) {
    translate(-9 + (time/4) -2.75, 21 - (2*time), 14);
  }
  scale(1.0,1.8,.8);
  box (2);
  popMatrix();
}
