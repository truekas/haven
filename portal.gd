extends Area2D

@onready var dest: Marker2D = $"../Level2";

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_on_body_entered);

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_body_entered(body: Node2D):
	if body.name == "Player":
		body.global_position = dest.global_position;
