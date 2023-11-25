extends Node2D

@onready var enemiesNode : Node2D = $Level/Enemies

var score : int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func increase_score():
	score += 1
	print('New Score: ', score)
