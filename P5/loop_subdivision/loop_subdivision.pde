// Sample code for starting the subdivision project

float time = 0;  // keep track of passing of time
boolean rotate_flag = true;       // automatic rotation of model?

mesh Mesh = new mesh();
boolean rand_color = false;
boolean per_vertex = false;

// initialize stuff
void setup() {
  size(700, 700, OPENGL);  // must use OPENGL here !!!
  noStroke();     // do not draw the edges of polygons
}

// Draw the scene
void draw() {
  
  resetMatrix();  // set the transformation matrix to the identity (important!)

  background(0);  // clear the screen to black
  
  // set up for perspective projection
  perspective (PI * 0.333, 1.0, 0.01, 1000.0);
  
  // place the camera in the scene (just like gluLookAt())
  camera (0.0, 0.0, 5.0, 0.0, 0.0, -1.0, 0.0, 1.0, 0.0);
    
  // create an ambient light source
  ambientLight(102, 102, 102);
  
  // create two directional light sources
  lightSpecular(204, 204, 204);
  directionalLight(102, 102, 102, -0.7, -0.7, -1);
  directionalLight(152, 152, 152, 0, 0, -1);
  
  pushMatrix();

  fill(200, 200, 200);
  ambient (200, 200, 200);
  specular(0, 0, 0);
  shininess(1.0);
  
  rotate (time, 0.0, 1.0, 0.0);
  
  // THIS IS WHERE YOU SHOULD DRAW THE MESH
  Mesh.mesh_assemble();
  for (int i = 0; i < Mesh.corner_table.size(); i++){
    if(i % 3 == 0) {
      beginShape();
      if (rand_color == true){
        PVector c = Mesh.face_colors.get(i);
        fill(c.x, c.y, c.z);
      }
    }
    if (per_vertex == true){  
      PVector vert = Mesh.get_vertex(i);
      PVector norm = Mesh.vertex_normals_list[Mesh.corner_table.get(i)];
      normal(norm.x,norm.y,norm.z);
      vertex(vert.x, vert.y, vert.z);
    } 
    else{
      PVector vert = Mesh.get_vertex(i);
      vertex(vert.x, vert.y, vert.z);
    }
    if(i % 3 == 2) {
      endShape(CLOSE);
    }
  }
  
  popMatrix();
 
  // maybe step forward in time (for object rotation)
  if (rotate_flag )
    time += 0.02;
}

// handle keyboard input
void keyPressed() {
  if (key == '1') {
    read_mesh ("tetra.ply");
  }
  else if (key == '2') {
    read_mesh ("octa.ply");
  }
  else if (key == '3') {
    read_mesh ("icos.ply");
  }
  else if (key == '4') {
    read_mesh ("star.ply");
  }
  else if (key == '5') {
    read_mesh ("torus.ply");
  }
  else if (key == 'n') {
    // toggle per-vertex normals
    if (per_vertex == true){
      per_vertex = false;
    }
    else {
      per_vertex = true;
    }
  }
  else if (key == 'r') {
    // random colors
    if (rand_color == true){
      rand_color = false;
    }
    else {
      rand_color = true;
    }
  }
  else if (key == 's') {
    // subdivide mesh
  }
  else if (key == ' ') {
    rotate_flag = !rotate_flag;          // rotate the model?
  }
  else if (key == 'q' || key == 'Q') {
    exit();                               // quit the program
  }
}

// Read polygon mesh from .ply file
//
// You should modify this routine to store all of the mesh data
// into a mesh data structure instead of printing it to the screen.
void read_mesh (String filename)
{
  Mesh = new mesh();
  int i;
  String[] words;
  
  String lines[] = loadStrings(filename);
  
  words = split (lines[0], " ");
  int num_vertices = int(words[1]);
  println ("number of vertices = " + num_vertices);
  
  words = split (lines[1], " ");
  int num_faces = int(words[1]);
  println ("number of faces = " + num_faces);
  
  // read in the vertices
  for (i = 0; i < num_vertices; i++) {
    words = split (lines[i+2], " ");
    float x = float(words[0]);
    float y = float(words[1]);
    float z = float(words[2]);
    println ("vertex = " + x + " " + y + " " + z);
    //put in mesh
    Mesh.add_vertex(x,y,z);
  }
  
  // read in the faces
  for (i = 0; i < num_faces; i++) {
    
    int j = i + num_vertices + 2;
    words = split (lines[j], " ");
    
    int nverts = int(words[0]);
    if (nverts != 3) {
      println ("error: this face is not a triangle.");
      exit();
    }
    
    int index1 = int(words[1]);
    int index2 = int(words[2]);
    int index3 = int(words[3]);
    println ("face = " + index1 + " " + index2 + " " + index3);
    Mesh.add_corners(index1, index2, index3);
  }
  Mesh.mesh_assemble();
}
