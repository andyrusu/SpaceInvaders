extends Path2D
class_name MoveController

@export var move : bool = true
@export var speed : float = 10.0

@onready var shipsPaths : Array[Node] = get_children()

var lastShipPath : PathFollow2D;

# Called when the node enters the scene tree for the first time.
func _ready():
	lastShipPath = shipsPaths[shipsPaths.size()-1]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (move == true):
		for row in shipsPaths:
			move_ship(row, delta)
	
	if lastShipPath.progress_ratio == 1.0:
		move = false

func move_ship(shipPath:PathFollow2D, delta):
	shipPath.progress += speed * delta
