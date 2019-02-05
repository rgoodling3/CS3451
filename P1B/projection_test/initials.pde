/******************************************************************************
Draw your initials here in perspective.
******************************************************************************/

void persp_initials()
{
  // you need to write this routine!

  gtInitialize();
  gtPerspective (60.0, 1.0, 100.0);

  gtPushMatrix();
  gtRotateX(-35.0);
  gtTranslate (0.0, 1.1, -3.0);
  rg();
  gtPopMatrix();
}

void rg() {
    gtBeginShape();

  /* Capital R */

  gtVertex (-1.0, -0.5,  1.0);
  gtVertex (-1.0,  1.0,  1.0);

  gtVertex (-1.0,  1.0,  1.0);
  gtVertex ( -0.5,  1.0,  1.0);
  
  gtVertex ( -0.5,  1.0,  1.0);
  gtVertex ( -0.3,  0.8,  1.0);
  
  gtVertex ( -0.3,  0.8,  1.0);
  gtVertex ( -0.3,  0.5,  1.0);
  
  gtVertex ( -0.3,  0.5,  1.0);
  gtVertex ( -0.5,  0.35,  1.0);
  
  gtVertex ( -0.5,  0.35,  1.0);
  gtVertex ( -1.0,  0.35,  1.0);
  
  gtVertex ( -1.0,  0.35,  1.0);
  gtVertex ( -0.3,  -0.5,  1.0);

  /* Capital G */
  
  gtVertex ( 0.0, -0.5,  1.0);
  gtVertex ( 0.0,  1.0,  1.0);
  
  gtVertex ( 0.0,  1.0,  1.0);
  gtVertex ( 0.8,  1.0,  1.0);
  
  gtVertex ( 0.0, -0.5,  1.0);
  gtVertex ( 1.0, -0.5,  1.0);
  
  gtVertex ( 1.0, -0.5,  1.0);
  gtVertex ( 1.0, 0.0,  1.0);
  
  gtVertex ( 1.0, 0.0,  1.0);
  gtVertex ( 0.6, 0.0,  1.0);

  gtEndShape();
}
