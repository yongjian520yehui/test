shader_type canvas_item;


uniform float width = 0.1;
uniform vec3 innerColor; // 内圈颜色
uniform vec3 outerColor; // 外圈颜色
/*白色圆环*/
void fragment() {
	float d = length(UV - 0.5);
	d = smoothstep(d, d+0.01 ,0.5);
	//
	float a = length(UV - 0.5);
	a = smoothstep(a, a+0.01 ,0.5 - width);
	//
	d= d-a;
	////vec3 color = mix(innerColor, outerColor);
//
	COLOR = COLOR * vec4(1.0, 1.0, 1.0, d);
}
 
