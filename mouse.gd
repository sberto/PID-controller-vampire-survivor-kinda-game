extends Area2D

var vulnerable: bool = true
var velocity: Vector2
@onready var l_proj: CharacterBody2D = $"../LinearProjectile"

@onready var max_health = health
var health = 10:
	set(v):
		health = v
		if health > 0:
			$Label.text = "%d/%d" % [health, max_health]
		else:
			$Label.text = "YOU LOSE!"
			get_tree().paused = true
			

func _physics_process(delta: float) -> void:
	var old_position = position
	position = get_viewport().get_mouse_position()
	if (position - old_position).length() > 0:
		velocity = position - old_position

func _ready() -> void:
	body_entered.connect(_hit)

func _hit(body: CharacterBody2D):
	if not vulnerable: return
	print("player hit!")
	health -= 1
	vulnerable = false
	get_tree().create_timer(1).timeout.connect(func(): vulnerable = true)
	
func _on_shoot_timeout() -> void:
	l_proj.position = position
	l_proj.velocity = velocity.normalized() * 1000
