uniform float time;
uniform float progress;
uniform float speed;
uniform sampler2D texture1;
uniform vec2 mouse;
uniform vec4 resolution;
varying vec2 vUv;
varying vec3 vPosition;
// float PI = 3.141592653589793238;
void main()	{
	float normSpeed = clamp(speed*40.,0.,1.);
	float mouseDist = length(vUv - mouse);

	float c = smoothstep(0.2,0.,mouseDist);
	vec2 newUV = (vUv - vec2(0.5))*resolution.zw + vec2(0.5);
	vec4 color = texture2D(texture1,newUV);

	float r = texture2D(texture1,newUV + 0.1*0.5*c*normSpeed).r;
	float g = texture2D(texture1,newUV + 0.1*0.3*c*normSpeed).g;
	float b = texture2D(texture1,newUV + 0.1*0.1*c*normSpeed).b;
	gl_FragColor = vec4(vUv,0.0,1.);
	gl_FragColor = color;
	gl_FragColor = vec4(normSpeed*mouseDist,0.,0.,1.);
	gl_FragColor = vec4(r,g,b,1.);
}