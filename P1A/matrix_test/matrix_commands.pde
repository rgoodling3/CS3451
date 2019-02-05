// Matrix Stack Library

// You should modify the routines below to complete the assignment.
// Feel free to define any classes, global variables, and helper routines that you need.
//Name: Riley Goodling

import java.util.Stack;
import java.util.Arrays;

Stack<float[][]> stack = new Stack<float[][]>();

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
  stack.push(matrix_multi((stack.peek()), matrix));
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
  stack.push(matrix_multi((stack.peek()), matrix));
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
  stack.push(matrix_multi((stack.peek()), matrix));
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
  stack.push(matrix_multi((stack.peek()), matrix));
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
  stack.push(matrix_multi((stack.peek()), matrix));
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
