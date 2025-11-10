extends Node2D

var level = 1 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Level.text = str(level)

func _input(event: InputEvent) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_WHEEL_UP):
		level +=1
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_WHEEL_DOWN):
		level -=1
	level = clamp(level, 1,128)
	$MeshInstance2D.mesh.set("subdivide_depth",level)
	$Level.text = str(level)
	
