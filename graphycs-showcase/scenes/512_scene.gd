extends Control

@export var scenes: Array[PackedScene] = []
var current_scene:int = 0
var previous_scene:int = 0
func _ready() -> void:
	add_child(scenes[current_scene].instantiate())
	
@warning_ignore("unused_parameter")
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_right"):
		current_scene+=1
	elif Input.is_action_just_pressed("ui_left"):
		current_scene-=1
	if current_scene<0:
		current_scene = 0
	elif current_scene>=len(scenes):
		current_scene = len(scenes)-1
	if(previous_scene ==current_scene):
		return
	previous_scene = current_scene
	for c in get_children():
		c.queue_free()
	add_child(scenes[current_scene].instantiate())
