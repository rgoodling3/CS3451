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
  vec4 diffuse_color = texture2D(texture, vertTexCoord.xy);
  for(int i = -10; i < 11; i++) {
    for (int j = -10; j < 11; j++){
      float offx = i / 256.0;
      float offy = j / 256.0;
      vec2 offsetxy = vec2(vertTexCoord.x + offx, vertTexCoord.y + offy);
      diffuse_color += texture2D(texture,offsetxy);
    }
  }
  diffuse_color = diffuse_color/400.0;
  float diffuse = clamp(dot (vertNormal, vertLightDir),1.0,1.0);
  gl_FragColor = vec4(diffuse * diffuse_color.rgb, 1.0);
}

