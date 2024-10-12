extends Node
var time = 0

var zombie_scn = preload("res://pid/game/zombie.tscn")

func _process(delta: float) -> void:
	time += delta
	if time > 1:
		time -= 1
		var zombie = zombie_scn.instantiate()
		zombie.set("position", _random_pos_around_mouse())
		add_child(zombie)

func _random_pos_around_mouse():
	var mouse = get_viewport().get_mouse_position()
	var x = _random_pos_float()
	var y = _random_pos_float()
	return mouse + Vector2(x,y)

func _random_pos_float():
	return randf_range(100, 300) * (randi_range(0,1) * 2 - 1)
