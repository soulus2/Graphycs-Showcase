shader_type canvas_item;
uniform bool show_x = false;
uniform bool show_y = false;
uniform bool open_gl= false;
uniform vec2 canvas_size = vec2(128.0, 128.0);
void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec4 o_color = vec4(0.0,0.0,0.0,1.0);
	vec4 w_color = vec4(0.0,0.0,0.0,1.0);

	if (show_x) {
		o_color.r = UV.x;
	}
	if (show_y) {
		o_color.g = UV.y;
		}
	if (open_gl) o_color.b=1.0;
	COLOR=o_color;
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
