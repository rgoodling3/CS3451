// Dummy routines for OpenGL commands.
// These are for you to write!
// You should incorporate your matrix stack routines from part A of this project.

import java.util.Stack;
import java.util.Arrays;
import java.util.List;
Stack<float[][]> stack = new Stack<float[][]>();
List<float[][]> vertices = new ArrayList<float[][]>();
boolean perspect = false;
boolean ortho = false;
List<Float> pValues = new ArrayList<Float>();
List<Float> oValues = new ArrayList<Float>();

void gtInitialize()
{
    //Clearing off the stack
    while (!stack.empty()) {
      stack.pop();
    }
    //Creating the first matrix with float 1.0 in the diagonal, 0.0 everywhere else
    float[][] init_float = new float[4][4];
    for(int i = 0; i < 4; i++) {
      init_float[i][i] = 1.0;
    }
  //Pushing identity matrix onto the stack 
  stack.push(init_float);
}

void gtPushMatrix()
{
  //Push onto the stack
  stack.push(stack.peek());
}

void gtPopMatrix()
{
  //Popping the top of the stack
  stack.pop();
  //Check to see if that is the last thing on the stack, then print an error
  if (stack.isEmpty()) {
    System.out.println("Cannot pop the matrix stack.");
  }
}

void gtTranslate(float x, float y, float z)
{
  //Creating the matrix to use for translation
  float[][] matrix = new float[4][4];
  matrix[0][0] = 1.0;
  matrix[0][1] = 0;
  matrix[0][2] = 0;
  matrix[0][3] = x;
  matrix[1][0] = 0;
  matrix[1][1] = 1.0;
  matrix[1][2] = 0;
  matrix[1][3] = y;
  matrix[2][0] = 0;
  matrix[2][1] = 0;
  matrix[2][2] = 1.0;
  matrix[2][3] = z;
  matrix[3][0] = 0;
  matrix[3][1] = 0;
  matrix[3][2] = 0;
  matrix[3][3] = 1.0;
  //Multiplying the top of the stack with the new matrix
  stack.push(matrix_multi((stack.pop()), matrix));
}

void gtScale(float x, float y, float z)
{
  //Creating the matrix to scale with
  float[][] matrix = new float[4][4];
  matrix[0][0] = x;
  matrix[0][1] = 0;
  matrix[0][2] = 0;
  matrix[0][3] = 0;
  matrix[1][0] = 0;
  matrix[1][1] = y;
  matrix[1][2] = 0;
  matrix[1][3] = 0;
  matrix[2][0] = 0;
  matrix[2][1] = 0;
  matrix[2][2] = z;
  matrix[2][3] = 0;
  matrix[3][0] = 0;
  matrix[3][1] = 0;
  matrix[3][2] = 0;
  matrix[3][3] = 1.0;
  //Multiplying the top of the stack with the new matrix
  stack.push(matrix_multi((stack.pop()), matrix));
}

void gtRotateX(float theta)
{
  //Converting degrees to radians
  theta = theta * PI / 180;
  //Creating the matrix to rotate in X axis
  float[][] matrix = new float[4][4];
  matrix[0][0] = 1.0;
  matrix[0][1] = 0;
  matrix[0][2] = 0;
  matrix[0][3] = 0;
  matrix[1][0] = 0;
  matrix[1][1] = cos(theta);
  matrix[1][2] = -sin(theta);
  matrix[1][3] = 0;
  matrix[2][0] = 0;
  matrix[2][1] = sin(theta);
  matrix[2][2] = cos(theta);
  matrix[2][3] = 0;
  matrix[3][0] = 0;
  matrix[3][1] = 0;
  matrix[3][2] = 0;
  matrix[3][3] = 1.0;
  //Multiplying the top of the stack with the new matrix
  stack.push(matrix_multi((stack.pop()), matrix));
}

void gtRotateY(float theta)
{
  //Converting degrees to radians
  theta = theta * PI / 180;
  //Creating the matrix to rotate in Y axis
  float[][] matrix = new float[4][4];
  matrix[0][0] = cos(theta);
  matrix[0][1] = 0;
  matrix[0][2] = sin(theta);
  matrix[0][3] = 0;
  matrix[1][0] = 0;
  matrix[1][1] = 1.0;
  matrix[1][2] = 0;
  matrix[1][3] = 0;
  matrix[2][0] = -sin(theta);
  matrix[2][1] = 0;
  matrix[2][2] = cos(theta);
  matrix[2][3] = 0;
  matrix[3][0] = 0;
  matrix[3][1] = 0;
  matrix[3][2] = 0;
  matrix[3][3] = 1.0;
  //Multiplying the top of the stack with the new matrix
  stack.push(matrix_multi((stack.pop()), matrix));
}

void gtRotateZ(float theta)
{
  //Converting degrees to radians
  theta = theta * PI / 180;
  //Creating the matrix to rotate in Z axis
  float[][] matrix = new float[4][4];
  matrix[0][0] = cos(theta);
  matrix[0][1] = -sin(theta);
  matrix[0][2] = 0;
  matrix[0][3] = 0;
  matrix[1][0] = sin(theta);
  matrix[1][1] = cos(theta);
  matrix[1][2] = 0;
  matrix[1][3] = 0;
  matrix[2][0] = 0;
  matrix[2][1] = 0;
  matrix[2][2] = 1.0;
  matrix[2][3] = 0;
  matrix[3][0] = 0;
  matrix[3][1] = 0;
  matrix[3][2] = 0;
  matrix[3][3] = 1.0;
  //Multiplying the top of the stack with the new matrix
  stack.push(matrix_multi((stack.pop()), matrix));
}

void print_ctm()
{
  //Copying the matrix at the top of the stack
  float[][] matrix = stack.peek();
  //Printing each line of the matrix
  for (float[] row : matrix) {
    System.out.println(Arrays.toString(row));
  }
  System.out.println();
}

void gtPerspective(float f, float near, float far)
{
  //Setting perspective flag to true
  perspect = true;
  //Clearing previous values
  pValues.clear();
  oValues.clear();
  ortho = false;
  //Loading new values
  pValues.add(f);
  pValues.add(near);
  pValues.add(far);
}

void gtOrtho(float l, float r, float b, float t, float n, float f)
{
  //Setting ortho flag to true
  ortho = true;
  //Clearing previous values
  oValues.clear();
  pValues.clear();
  perspect = false;
  //Loading new values
  oValues.add(l);
  oValues.add(r);
  oValues.add(b);
  oValues.add(t);
  oValues.add(n);
  oValues.add(f);
}

void gtBeginShape()
{
  //Starting a new list to store vertices
   vertices = new ArrayList<float[][]>();
   vertices.clear();
}

void gtVertex(float x, float y, float z)
{
  float[][] matrix = new float[4][1];
  matrix[0][0] = x;
  matrix[1][0] = y;
  matrix[2][0] = z;
  matrix[3][0] = 1;
  
  matrix = matrix_multi(stack.peek(), matrix);
  if(perspect) { //Projection perspective
    //Create k value
    float k = 2 * tan(radians(pValues.get(0))/2);
    //Use equations to change points
    float yp = (-matrix[1][0] / abs(matrix[2][0]) + k/2) * (height/(k)); 
    float xp = (matrix[0][0] / abs(matrix[2][0]) + k/2) * (width/ (k));
    matrix[0][0] = xp;
    matrix[1][0] = yp;
    vertices.add(matrix);
  } else { //Ortho perspective
  //Use equations to change points
    float xp = (matrix[0][0] - oValues.get(0)) * width / (oValues.get(1) - oValues.get(0));
    float yp = (matrix[1][0] - oValues.get(3)) * height / (oValues.get(2) - oValues.get(3));
    matrix[0][0] = xp;
    matrix[1][0] = yp;
    vertices.add(matrix);
  }
}

void gtEndShape()
{
  //Connecting lines to the vertices
  for (int i = 0; i < vertices.size() - 1; i = i + 2) {
    line(vertices.get(i)[0][0], vertices.get(i)[1][0], vertices.get(i + 1)[0][0], vertices.get(i + 1)[1][0]);
  }
}

float[][] matrix_multi(float[][] one, float[][] two)
{
    int oneColumns = one[0].length;
    int twoColumns = two[0].length;
    int oneRows = one.length;
    
    //Creating an empty matrix to be our multiplied matrices
    float[][] multiplied = new float[oneRows][twoColumns];
    //Multiplying matrices, in spot [i,j] is the product of first matrix[i,k] and second 
    //matrix[k,j]
    for (int i = 0; i < oneRows; i++) {
      for (int j = 0; j < twoColumns; j++) {
        for (int k = 0; k < oneColumns; k++) {
          multiplied[i][j] += one[i][k] * two[k][j];
        }
      }
    }
    return multiplied;
}
