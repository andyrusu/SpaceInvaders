extends RigidBody2D
class_name Enemy

@onready var sprite : Sprite2D = $Sprite2D
@onready var animSprite : AnimatedSprite2D = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.visible = true
	animSprite.visible = false
	animSprite.animation_finished.connect(queue_free)

func die():
	sprite.visible = false
	animSprite.visible = true
	animSprite.play("explosion")
