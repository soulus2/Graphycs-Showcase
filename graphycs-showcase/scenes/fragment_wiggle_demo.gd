extends TextureRect

var def_sep_lev = 0.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$HBoxContainer/R.button_pressed = material.get("shader_parameter/r")
	$HBoxContainer/G.button_pressed = material.get("shader_parameter/g")
	$HBoxContainer/B.button_pressed = material.get("shader_parameter/b")
	material.set("shader_parameter/separation_level",def_sep_lev)
	

func _input(event: InputEvent) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_WHEEL_UP):
		def_sep_lev+=0.1
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_WHEEL_DOWN):
		def_sep_lev-=0.1
	def_sep_lev = clamp(def_sep_lev, 0, 2*PI)
	material.set("shader_parameter/separation_level",def_sep_lev)
	

func _on_r_toggled(toggled_on: bool) -> void:
	material.set("shader_parameter/r",toggled_on)

func _on_g_toggled(toggled_on: bool) -> void:
	material.set("shader_parameter/g",toggled_on)


func _on_b_toggled(toggled_on: bool) -> void:
	material.set("shader_parameter/b",toggled_on)
