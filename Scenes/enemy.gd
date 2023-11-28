extends RigidBody2D
class_name Enemy

@export var fireLimit : int = 1

@onready var sprite : Sprite2D = $Sprite2D
@onready var animSprite : AnimatedSprite2D = $AnimatedSprite2D
@onready var laserStartingPosition : Marker2D = $Marker2D
@onready var timer : Timer = $FireInterval

var maxRange : int = fireLimit * 100
var fireTest : int = maxRange * .9

# Called when the node enters the scene tree for the first time.
func _ready():
	# Initialization of nodes
	sprite.visible = true
	animSprite.visible = false
	animSprite.animation_finished.connect(queue_free)
	
	# TimerInterval initialization
	timer.wait_time = randi_range(5, 30)
	timer.start()

func _physics_process(delta):
	if randi_range(1, maxRange) > fireTest && timer.is_stopped():
		fire_laser()

func die():
	sprite.visible = false
	animSprite.visible = true
	animSprite.play("explosion")

func fire_laser():
	var laser = preload("res://Scenes/laser.tscn").instantiate()
	laser.position = laserStartingPosition.global_position
	get_node('/root/Main').add_child(laser)
	timer.start()
