extends Node2D
@export var ap : AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_next1_pressed() -> void:
	get_tree().change_scene_to_file("res://node_2d.tscn") # Replace with function body.


func _on_next2_pressed() -> void:
	get_tree().change_scene_to_file("res://node_2d.tscn") # Replace with function body.
