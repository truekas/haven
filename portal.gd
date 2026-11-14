extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_on_body_entered);

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_body_entered(body: Node2D):
	if body.name == "Player":
		var level_num = int(self.name.substr(6));
		print(level_num);
		var dest = get_node("../Level%s" % (level_num + 1));
		body.global_position = dest.global_position;
