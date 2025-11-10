shader_type canvas_item;
uniform float mesh_height = 100.0;
uniform float freq = 2.0;
uniform float amplitude = 10.0;

void vertex() {
    float y_norm = VERTEX.y / mesh_height;
    VERTEX.x += sin(TIME + y_norm * freq * TAU) * amplitude;
}



//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
