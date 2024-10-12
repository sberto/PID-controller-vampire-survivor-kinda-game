extends Area2D

@export var lead: Area2D
@export var k: float = 1
@export var ti: float = 1
@export var td: float = 0.01

var old_e: Vector2 = Vector2(0,0)
var ei: Vector2 = Vector2(0,0)
var ed: Vector2 = Vector2(0,0)
var _int_max = Vector2(200,200)

func _process(delta):
	var e = lead.position - position
	
	assert(not is_nan(e.x))
	assert(not is_nan(e.y))
	
	ei += e * delta
	ed += e / delta
	#ei = clamp(ei, -_int_max, _int_max)
	position += k * ((1 + td/ti) * e + ei/ti + ed*td)
