uniform float time;
uniform float progress;
varying vec2 vUv;
varying vec3 vPosition;
uniform vec2 pixels;
// float PI = 3.141592653589793238;
void main() {

  vec3 pos = position;

  // pos.z = 0.1*sin(pos.x*10.);
  float distance = length(uv - vec2(0.5));
  float maxdist = length(vec2(0.5));

  float normalizedDistance = distance/maxdist;

  float stickTo = normalizedDistance;

  float superProgress = min(2.*progress, 2.*(1. - progress));

  pos.z +=stickTo*superProgress;

  vUv = uv;
  gl_Position = projectionMatrix * modelViewMatrix * vec4( pos, 1.0 );
}