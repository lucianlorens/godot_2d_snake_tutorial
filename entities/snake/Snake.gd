extends Node2D

class_name Snake

signal move_triggered(entity, direction)

# Declare member variables here. Examples:
onready var direction: Vector2 = Vector2()
onready var can_move: bool = false 

# Called when the node enters the scene tree for the first time.
func _ready():
	$PlayerInputComponent.connect("input_detected", self, "_on_PlayerInputComponent_input_detected") 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if direction != Vector2():
		emit_signal("move_triggered", self, direction)
		
		can_move = false
		$MoveDelay.start()

func _on_PlayerInputComponent_input_detected(new_direction) -> void:
	if new_direction != direction * -1:
		direction = new_direction
		print(direction)


func _on_MoveDelay_timeout() -> void:
	can_move = true
	
