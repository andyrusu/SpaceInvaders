extends Area2D

@export var initialHealth : int = 100;

@onready var healthBar : ProgressBar = $ProgressBar

# Called when the node enters the scene tree for the first time.
func _ready():
	healthBar.max_value = initialHealth
	healthBar.value = initialHealth

func take_damage(damage):
	healthBar.value -= damage
	
	if (healthBar.value <= 0):
		queue_free();

func _on_body_entered(body):
	if body is Laser:
		take_damage(body.damage)
		body.queue_free()
