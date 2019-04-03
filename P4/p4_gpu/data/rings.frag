// Fragment shader

#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_LIGHT_SHADER

// These values come from the vertex shader
varying vec4 vertColor;
varying vec3 vertNormal;
varying vec3 vertLightDir;
varying vec4 vertTexCoord;

void ring(float x, float y) {
  float radius = 0.15;
  float small_rad = .12;
  float xcalc = vertTexCoord.x - x;
  float ycalc = vertTexCoord.y - y;
  float equation = xcalc*xcalc + ycalc*ycalc;
  if(equation < (radius * radius) && equation > (small_rad * small_rad)){
    gl_FragColor = vec4(0.0, 1.0, 1.0, 1);
  }
}

void main() {
  gl_FragColor = vec4(0.0, 1.0, 1.0, 0);
  ring(.2,.25);
  ring(.4,.25);
  ring(.6,.25);
  ring(.3,.4);
  ring(.5,.4);
}

