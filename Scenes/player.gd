extends CharacterBody2D
class_name Player

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var bulletStartingPosition : Marker2D = $BulletStartingPosition
@onready var timer : Timer = $Timer
@onready var animation : AnimatedSprite2D = $AnimatedSprite2D

func _ready():
	animation.animation_finished.connect(func(): animation.visible = false)

func _physics_process(delta):
	move_on_input()
	shoot_on_input()

func move_on_input():
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func shoot_on_input():
	if (Input.is_action_just_pressed("ui_select") && timer.is_stopped()):
		var bullet = preload("res://Scenes/bullet.tscn").instantiate()
		bullet.position = bulletStartingPosition.global_position
		get_node('/root/Main').add_child(bullet)
		start_fire_animation()
		timer.start()

func start_fire_animation():
	if not animation.is_playing():
		animation.visible = true
		animation.play("fire")
