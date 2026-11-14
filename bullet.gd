extends Area2D

const SPEED = 7500;
func _ready() -> void:
	body_entered.connect(_on_body_entered);
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	position += transform.x * SPEED * delta

func _on_body_entered(body: Node2D):
	print(body.name)
	if body.name == "AliceHuang" and body.has_method("hit"):
		print("HIT ALICE HUANG");
		body.hit();
	
	hide();
	set_physics_process(false);
	queue_free();
