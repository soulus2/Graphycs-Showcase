extends TextureRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$HBoxContainer/X.button_pressed = material.get("shader_parameter/show_x")
	$HBoxContainer/Y.button_pressed = material.get("shader_parameter/show_y")
	$HBoxContainer/Z.button_pressed = material.get("shader_parameter/open_gl")


func _on_x_toggled(toggled_on: bool) -> void:
	material.set("shader_parameter/show_x",toggled_on)

func _on_y_toggled(toggled_on: bool) -> void:
	material.set("shader_parameter/show_y",toggled_on)
	pass # Replace with function body.

func _on_z_toggled(toggled_on: bool) -> void:
	material.set("shader_parameter/open_gl",toggled_on)
