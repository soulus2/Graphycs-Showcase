extends TextureRect

@export var noise:NoiseTexture2D = preload("res://shaders/island_demo_noise.tres")
var water_level:float = 0.0
func _ready() -> void:
	water_level = material.get("shader_parameter/water_level")
func _input(event: InputEvent) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		if event is InputEventMouseMotion:
			noise.noise.set("offset", Vector3(noise.noise.get("offset").x-event.relative.x,noise.noise.get("offset").y-event.relative.y,0.0))
			material.set("shader_parameter/noise",noise)
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_WHEEL_UP):
		water_level+=0.01
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_WHEEL_DOWN):
		water_level-=0.01
	water_level = clamp(water_level,0.0,1.0)
	material.set("shader_parameter/water_level",water_level)
