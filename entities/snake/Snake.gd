extends Node2D

class_name Snake

# Declare member variables here. Examples:
onready var direction: Vector2 = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	$PlayerInputComponent.connect("input_detected", self, "_on_PlayerInputComponent_input_detected") 

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_PlayerInputComponent_input_detected(new_direction) -> void:
	if new_direction != direction * -1:
		direction = new_direction
		print(direction)
