extends TextureRect

@export var shrink:int = 10;
@export var shrink_accel:int = 1
@export var def_radius:int = 150
@export var def_col:Color = Color(1.0,1.0,1.0,1.0)
@export var drag_col:Color = Color(1.0, 1.0, 1.0, 0.851)
func _ready() -> void:
	material.set("shader_parameter/radius",def_radius)
	material.set("shader_parameter/fg_col",def_col)
func _input(event: InputEvent) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		if event is InputEventMouseMotion:
			material.set("shader_parameter/offset",event.relative+material.get("shader_parameter/offset"))
			
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_WHEEL_UP):
		def_radius+=5
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_WHEEL_DOWN):
		def_radius-=5
func _process(delta: float) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		material.set("shader_parameter/radius",material.get("shader_parameter/radius")-shrink_accel)
		material.set("shader_parameter/fg_col",drag_col)
	else:
		material.set("shader_parameter/radius",material.get("shader_parameter/radius")+shrink_accel)
		material.set("shader_parameter/fg_col",def_col)
	if material.get("shader_parameter/radius")<def_radius-shrink:
		material.set("shader_parameter/radius",def_radius-shrink)
	elif material.get("shader_parameter/radius")>def_radius:
		material.set("shader_parameter/radius",def_radius)
