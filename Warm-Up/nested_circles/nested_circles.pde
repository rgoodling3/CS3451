void setup() {
  size (500,500);
}
float r2 = .3;
void draw() {
  background (255,255,255);
  noStroke();
  
  fill (255, 234, 253);
  ellipse(250.0, 250.0, 500.0, 500.0);
  float theta = mouseX/500.0 * 2 * PI - (PI / 2);

  draw3circ1(theta, 250.0, 250.0, 250.0);
}

void draw3circ1(float theta, float r1, float x, float y) {
  float originalTheta = theta;
  for(int i = 0; i < 3; i++) {
    fill (255,186,251);
    float radius = (500 - mouseY)/500.0 * (500 * r2);
    float newX =(r1 - radius) * cos(theta) + x;
    float newY = (r1-radius) * sin(theta) + y;
    ellipse (newX,newY,radius * 2,radius * 2);
    draw3circ2(originalTheta, radius, newX, newY);
    theta = theta + 2 * PI /3;
  }
}
void draw3circ2(float theta, float r1, float x, float y) {
  float originalTheta = theta;
  for(int i = 0; i < 3; i++) {
    fill (255,142,249);
    float radius = (500 - mouseY)/500.0 * (r1 * 2 * r2);
    float newX =(r1-radius) * cos(theta) + x;
    float newY = (r1-radius) * sin(theta) + y;
    ellipse (newX, newY, radius * 2, radius * 2);
    draw3circ3(originalTheta, radius, newX, newY);
    theta = theta + 2 * PI /3;
  }
}
void draw3circ3(float theta, float r1, float x, float y) {
  float originalTheta = theta; //<>//
  for(int i = 0; i < 3; i++) {
    fill (255,91,246);
    float radius = (500 - mouseY)/500.0 * (r1 * 2 * r2);
    float newX =(r1-radius) * cos(theta) + x;
    float newY = (r1-radius) * sin(theta) + y;
    ellipse (newX, newY, radius * 2, radius * 2);
    draw3circ4(originalTheta, radius, newX, newY);
    theta = theta + 2 * PI /3;
  }
}
void draw3circ4(float theta, float r1, float x, float y) {
  float originalTheta = theta;
  for(int i = 0; i < 3; i++) {
    fill (255,48,244);
    float radius = (500 - mouseY)/500.0 * (r1 * 2 * r2);
    float newX =(r1-radius) * cos(theta) + x;
    float newY = (r1-radius) * sin(theta) + y;
    ellipse (newX, newY, radius * 2, radius * 2);
    draw3circ5(originalTheta, radius, newX, newY);
    theta = theta + 2 * PI /3;
  }
}
void draw3circ5(float theta, float r1, float x, float y) {
  for(int i = 0; i < 3; i++) {
    fill (204,12,194);
    float radius = (500 - mouseY)/500.0 * (r1 * 2 * r2);
    float newX =(r1-radius) * cos(theta) + x;
    float newY = (r1-radius) * sin(theta) + y;
    ellipse (newX, newY, radius * 2, radius * 2);
    theta = theta + 2 * PI /3;
  }
}
