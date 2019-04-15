 class mesh{
  ArrayList<PVector> vertex_table;
  ArrayList<Integer> corner_table;
  ArrayList<Integer> opposite_table;
  ArrayList<PVector> face_normals_list;
  PVector[] vertex_normals_list;
  ArrayList<PVector> face_colors;
  
  mesh(){
    vertex_table = new ArrayList<PVector>() ;
    corner_table = new ArrayList<Integer>();
    corner_table = new ArrayList<Integer>() ;
    opposite_table = new ArrayList<Integer>() ;
    face_normals_list = new ArrayList<PVector>() ;
    face_colors = new ArrayList<PVector> ();
  }
  
  void mesh_assemble() {
    generating_random_face_colors();
    generating_vertex_normals();
    generating_face_normals();
  }
  void add_vertex(float x, float y, float z) {
    vertex_table.add(new PVector(x,y,z));
  }
  
  void add_corners(int index1, int index2, int index3){
    corner_table.add(index1);
    corner_table.add(index2);
    corner_table.add(index3);
    
  }
  
  void generating_opposite_table(){
    for(int a: corner_table){
      for(int b: corner_table){
        if(get_next(a) == get_previous(b) && get_next(b) == get_previous(a)){
          opposite_table.add(a,b);
          opposite_table.add(b,a);
        }
      }
    }
  }
  
  void generating_face_normals(){
    for(int i = 0; i < corner_table.size(); i = i + 3){
      PVector a = vertex_table.get(corner_table.get(i));
      PVector b = vertex_table.get(corner_table.get(get_next(i)));
      PVector c = vertex_table.get(corner_table.get(get_previous(i)));
      PVector ab = PVector.sub(b,a);
      PVector ac = PVector.sub(c,a);
      PVector normal = new PVector();
      PVector.cross(ab,ac,normal);
      face_normals_list.add(normal.normalize());
    }
  }
  
  int swing(int c){
    generating_opposite_table();
    int o = opposite_table.get(get_next(c));
    int swing = get_next(o);
    return swing; 
  }
  
  void generating_vertex_normals(){
    generating_face_normals();
    vertex_normals_list = new PVector[vertex_table.size()];
    for(int i = 0; i < corner_table.size(); i++) {
      PVector one = face_normals_list.get(int(i/3));
      one.normalize();
      vertex_normals_list[corner_table.get(i)] = one;
    }
  }
  
  void generating_random_face_colors(){
    for(int i = 0; i < vertex_table.size(); i +=3){
      PVector c = new PVector(random(255.0), random(255.0), random(255.0));
      face_colors.add(c);
      face_colors.add(c);
      face_colors.add(c);;
    }
  }
  
  int get_previous(int corner){
    return get_next(get_next(corner));
  }
  
  int get_next(int corner){
    int next = 3 * (corner/3) + (corner + 1) % 3;
    return next;
  }
  
  PVector get_vertex(int i){
    return vertex_table.get(corner_table.get(i));
  }
  
  int get_opposites(int i){
    return opposite_table.get(i);
  }
  
  void get_face_number(){
    
  }
}
