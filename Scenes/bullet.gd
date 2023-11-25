extends RigidBody2D
class_name Bullet

var speed : float = 10.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_and_collide(Vector2(0, -1)*speed)

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _on_body_entered(body):
	if (body is Enemy):
		body.die()
		get_tree().call_group('Game', 'increase_score')
		
	queue_free()
