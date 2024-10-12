extends CharacterBody2D
class_name Enemy

@onready var label = $Label
@export var speed = 10_000
@export var health = 10:
	set(v):
		health = v
		if health <= 0: queue_free()
		label.text = "%.1f/%s" % [health, max_health]
var max_health = health

func _physics_process(delta: float):
	velocity = (get_viewport().get_mouse_position() - position).normalized() * speed * delta
	move_and_slide()
