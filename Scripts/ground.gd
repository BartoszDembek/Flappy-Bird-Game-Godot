extends Node2D

var speed = 150

@onready var sprite1 = $GroundSprite1
@onready var sprite2 = $GroundSprite2

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite2.global_position.x = sprite1.global_position.x + sprite1.texture.get_width()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	sprite1.global_position.x -= speed * delta
	sprite2.global_position.x -= speed * delta
	
	if sprite1.global_position.x < -sprite1.texture.get_width():
		sprite1.global_position.x = sprite2.global_position.x + sprite2.texture.get_width()
	
	if sprite2.global_position.x < -sprite2.texture.get_width():
		sprite2.global_position.x = sprite1.global_position.x + sprite1.texture.get_width()

func start_ground():
	speed = 150

func stop_ground():
	speed = 0
