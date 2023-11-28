extends Node2D

@onready var enemiesNode : Node2D = $Level/Enemies
@onready var player : Player = $Player
@onready var livesContainer : HBoxContainer = $UI/LeftCorner/LiveContainer
@onready var scoreLabel : Label = $UI/RightCorner/Score/ScoreValue

var score : int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	
	for i in player.lives:
		create_life_ui()

func create_life_ui():
	var rect : TextureRect = TextureRect.new()
	rect.texture = load("res://Assets/hud_heartFull.png")
	livesContainer.add_child(rect)

func increase_score():
	score += 1
	scoreLabel.text = str(score)

func remove_one_life():
	var lives = livesContainer.get_children();
	
	for life in lives:
		if life is TextureRect:
			life.queue_free()
			return
