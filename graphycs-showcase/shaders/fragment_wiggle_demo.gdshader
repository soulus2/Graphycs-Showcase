shader_type canvas_item;
uniform sampler2D tex;
uniform float amplitude = 10.0;
uniform float freq = 10.0;
uniform bool r = true;
uniform bool g = true;
uniform bool b = true;
uniform float separation_level = 0.0;
void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec2 uvr = vec2(sin(TIME+UV.y*freq+separation_level)*amplitude/100.0+UV.x,UV.y);
	vec2 uvg = vec2(sin(TIME+UV.y*freq)*amplitude/100.0+UV.x,UV.y);
	vec2 uvb = vec2(sin(TIME+UV.y*freq-separation_level)*amplitude/100.0+UV.x,UV.y);
	
	
	vec4 tr = texture(tex,uvr);
	vec4 tg = texture(tex,uvg);
	vec4 tb = texture(tex,uvb);
	
	if (!r) tr.x=0.0;
	if (!g) tg.y=0.0;
	if (!b) tb.z=0.0;
	COLOR = vec4(tr.r,tg.g,tb.b,tr.a);
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
