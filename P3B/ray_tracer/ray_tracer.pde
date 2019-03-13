// Riley Goodling
// This is the starter code for the CS 3451 Ray Tracing project.
//
// The most important part of this code is the interpreter, which will
// help you parse the scene description (.cli) files.

import java.util.ArrayList;

ArrayList<Light> lights = new ArrayList();
ArrayList<Shape> shapes = new ArrayList();
Surface surface;
float fov;
float red;
float green;
float blue;
float eyex;
float eyey;
float eyez;
float ux;
float uy;
float uz;
float vx;
float vy;
float vz;
float wx;
float wy;
float wz;


void setup() {
  size(400, 400);  
  noStroke();
  colorMode(RGB);
  background(0, 0, 0);
}

void reset_scene() {
  //reset your global scene variables here
  lights = new ArrayList();
  shapes = new ArrayList();
  surface = null;
  fov = 0.0;
  red = 0.0;
  green = 0.0;
  blue = 0.0;
  eyex = 0.0;
  eyey = 0.0;
  eyez = 0.0;
  ux = 0.0;
  uy = 0.0;
  uz = 0.0;
  vx = 0.0;
  vy = 0.0;
  vz = 0.0;
  wx = 0.0;
  wy = 0.0;
  wz = 0.0;
}

void keyPressed() {
  reset_scene();
  switch(key) {
    case '1':  interpreter("01_one_sphere.cli"); break;
    case '2':  interpreter("02_three_spheres.cli"); break;
    case '3':  interpreter("03_shiny_sphere.cli"); break;
    case '4':  interpreter("04_one_cone.cli"); break;
    case '5':  interpreter("05_more_cones.cli"); break;
    case '6':  interpreter("06_ice_cream.cli"); break;
    case '7':  interpreter("07_colorful_lights.cli"); break;
    case '8':  interpreter("08_reflective_sphere.cli"); break;
    case '9':  interpreter("09_mirror_spheres.cli"); break;
    case '0':  interpreter("10_reflections_in_reflections.cli"); break;
    case 'q':  exit(); break;
  }
}


// this routine helps parse the text in a scene description file
void interpreter(String filename) {
  
  println("Parsing '" + filename + "'");
  String str[] = loadStrings(filename);
  if (str == null) println("Error! Failed to read the file.");
  
  for (int i = 0; i < str.length; i++) {
    
    String[] token = splitTokens(str[i], " "); // Get a line and parse tokens.
    
    if (token.length == 0) continue; // Skip blank line.
    
    if (token[0].equals("fov")) {
      fov = float(token[1]);
      // call routine to save the field of view
    }
    else if (token[0].equals("background")) {
      red = float(token[1]);
      green = float(token[2]);
      blue = float(token[3]);
      // call routine to save the background color
    }
    else if (token[0].equals("eye")) {
      eyex = float(token[1]);
      eyey = float(token[2]);
      eyez = float(token[3]);
      // call routine to save the eye position
    }
    else if (token[0].equals("uvw")) {
      ux = float(token[1]);
      uy = float(token[2]);
      uz = float(token[3]);
      vx = float(token[4]);
      vy = float(token[5]);
      vz = float(token[6]);
      wx = float(token[7]);
      wy = float(token[8]);
      wz = float(token[9]);
      // call routine to save the camera u,v,w
    }
    else if (token[0].equals("light")) {
      float x = float(token[1]);
      float y = float(token[2]);
      float z = float(token[3]);
      float r = float(token[4]);
      float g = float(token[5]);
      float b = float(token[6]);
      Light light = new Light(x,y,z,r,g,b);
      lights.add(light);
      // call routine to save light information
    }
    else if (token[0].equals("surface")) {
      float Cdr = float(token[1]);
      float Cdg = float(token[2]);
      float Cdb = float(token[3]);
      float Car = float(token[4]);
      float Cag = float(token[5]);
      float Cab = float(token[6]);
      float Csr = float(token[7]);
      float Csg = float(token[8]);
      float Csb = float(token[9]);
      float P = float(token[10]);
      float K = float(token[11]);
      surface = new Surface(Cdr,Cdg,Cdb,Car,Cag,Cab,Csr,Csg,Csb,P,K);
      // call routine to save surface materials
    }    
    else if (token[0].equals("sphere")) {
      float r = float(token[1]);
      float x = float(token[2]);
      float y = float(token[3]);
      float z = float(token[4]);
      Sphere sphere = new Sphere(r,x,y,z);
      sphere.surface(surface);
      shapes.add(sphere);
      // call routine to save sphere
    }
    else if (token[0].equals("cone")) {
      float x = float(token[1]);
      float y = float(token[2]);
      float z = float(token[3]);
      float h = float(token[4]);
      float k = float(token[5]);
      Cone cone = new Cone(x,y,z,h,k);
      cone.surface(surface);
      shapes.add(cone);
      // call routine to save cone
    }
    else if (token[0].equals("write")) {
      draw_scene();   // this is where you actually perform the ray tracing
      println("Saving image to '" + token[1] + "'");
      save(token[1]); // this saves your ray traced scene to a PNG file
    }
    else if (token[0].equals("#")) {
      // comment symbol
    }
    else {
      println ("cannot parse line: " + str[i]);
    }
  }
}

// This is where you should put your code for creating eye rays and tracing them.
void draw_scene() {
  System.out.println(shapes);
  for(int y = 0; y < height; y++) {
    for(int x = 0; x < width; x++) {
      float[] pxcolor = new float[3];
      float[] pxcolorD = new float[3];
      float[] pxcolorS = new float[3];
      float[] pxcolorR = new float[3];
      // create and cast an eye ray
      float d = 1.0/tan(radians(fov)/2.0);
      float u = -1 + (2 * x/float(width));
      float v = -(-1 + (2 * y/float(height)));
      Ray r = new Ray(); 
      r.origin(eyex,eyey,eyez);
      float xprime = u * ux + v * vx - d * wx;
      float yprime = u * uy + v * vy - d * wy;
      float zprime = u * uz + v * vz - d * wz;
      r.direction(xprime,yprime,zprime);
      
      //System.out.println("Origin" + eyex + " " + eyey + " " + eyez);
      //System.out.println("Direction " + xprime + " " + yprime + " " + zprime);
      float mint = 9999;
      Shape hitobj = null;
      float t3 = 0.0;
      for(Shape s : shapes) {
        float[] check = s.checkInter(r);
        if (check[0] < mint && check[0] > 0) {
          mint = check[0];
          t3 = check[1];
          hitobj = s;
        }
      }
      PVector eyeanddir = PVector.mult(r.getdirection(),mint); 
      eyeanddir = PVector.add(eyeanddir, r.getorigin());
      if (hitobj == null || hitobj.getSurface() == null) {
        pxcolor[0] = red;
        pxcolor[1] = green;
        pxcolor[2] = blue;
      } else {
        PVector blee = PVector.mult(r.getdirection(), mint);
        PVector hitpos = PVector.add(r.getorigin(), blee);
        float[] arr = new float[5];
        arr[0] = hitpos.x;
        arr[1] = hitpos.y;
        arr[2] = hitpos.z;
        arr[3] = mint;
        arr[4] = t3;
        PVector normal = hitobj.getNormal(arr,r);
        
        for (Light l:lights) {
          PVector lightpos = (PVector.sub(l.getlightpos(), hitpos)).normalize();
          Ray shadowRay = new Ray();
          shadowRay.origin(hitpos.x,hitpos.y,hitpos.z);
          boolean shadowmaybe = false;
          shadowRay.direction(lightpos.x - hitpos.x, lightpos.y - hitpos.y,lightpos.z - hitpos.z);
          for (Shape sha:shapes) {
            if(sha == hitobj) {
              continue;
            }
            float[] shadowCheck = sha.checkInter(shadowRay);
            if (shadowCheck[0] > 0 && shadowCheck[0] < 1) {
              shadowmaybe = true; 
              break;
            }
          }
          if (shadowmaybe) {
            continue;
          }
          PVector eyePos = new PVector(eyex, eyey, eyez);
          PVector hold = PVector.sub(eyePos, hitpos);
          PVector eyeNormal = hold.normalize();
          PVector halfAngleVec = PVector.add(eyeNormal, lightpos);
          halfAngleVec = halfAngleVec.normalize();
          pxcolorD[0] += l.getRGB()[0] * max(0, PVector.dot(normal,lightpos));
          pxcolorD[1] += l.getRGB()[1] * max(0, PVector.dot(normal,lightpos));
          pxcolorD[2] += l.getRGB()[2] * max(0, PVector.dot(normal,lightpos));
          
          pxcolorS[0] += l.getRGB()[0] * max(0, PVector.dot(normal,halfAngleVec));
          pxcolorS[1] += l.getRGB()[1] * max(0, PVector.dot(normal,halfAngleVec));
          pxcolorS[2] += l.getRGB()[2] * max(0, PVector.dot(normal,halfAngleVec));
          
        }
        pxcolorD[0] *= hitobj.getSurface().getCdr();
        pxcolorD[1] *= hitobj.getSurface().getCdg();
        pxcolorD[2] *= hitobj.getSurface().getCdb();
        
        pxcolorS[0] *= hitobj.getSurface().getCsr();
        pxcolorS[1] *= hitobj.getSurface().getCsg();
        pxcolorS[2] *= hitobj.getSurface().getCsb();
        
        pxcolor[0] = pxcolorD[0] + pxcolorS[0] + pxcolorR[0] + hitobj.getSurface().getCar();
        pxcolor[1] = pxcolorD[1] + pxcolorS[1] + pxcolorR[1] + hitobj.getSurface().getCag();
        pxcolor[2] = pxcolorD[2] + pxcolorS[2] + pxcolorR[2] + hitobj.getSurface().getCab();
        //pxColor = pxColorD + pxS + pxR + A;
      }
      //set the pixel color
      fill (pxcolor[0]*255, pxcolor[1]*255, pxcolor[2]*255);   // you should put the correct pixel color here, converting from [0,1] to [0,255]
      rect (x, y, 1, 1);   // make a tiny rectangle to fill the pixel
    }
  }
}


void draw() {
  // nothing should be placed here for this project!
}
