shader_type canvas_item;

uniform int radius = 50;
uniform vec2 canvas_size = vec2(128.0, 128.0); 
uniform vec2 offset = vec2(64.0,64.0);
uniform vec4 fg_col = vec4(1.0, 1.0, 1.0, 1.0);

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec2 pos = floor(UV * canvas_size);
	pos = vec2(pos.x-offset.x,pos.y-offset.y);
	float r = float(radius);
	if (r*r-pos.y*pos.y>=pos.x*pos.x && r*r-pos.x*pos.x>=pos.y*pos.y) COLOR = fg_col;
	else COLOR = vec4(0.0,0.0,0.0,0.0);
	
	
}
