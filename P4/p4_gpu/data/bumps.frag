// Fragment shader

#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_TEXLIGHT_SHADER

// Set in Processing
uniform sampler2D texture;

// These values come from the vertex shader
varying vec4 vertColor;
varying vec3 vertNormal;
varying vec3 vertLightDir;
varying vec4 vertTexCoord;

void main() {
  vec4 diffuse_color = texture2D(texture, vertTexCoord.st) * vertColor;
  diffuse_color = 1 - diffuse_color;
  gl_FragColor = vec4(diffuse_color.rgb, 1.0);
}