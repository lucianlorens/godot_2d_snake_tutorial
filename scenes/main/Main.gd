extends Node


# Declare member variables here. Examples:
const scene_food = preload("res://entities/food/food.tscn")
#const scene_tail = preload("res://entities/tail/tail.tscn")
const scene_snake = preload("res://entities/snake/Snake.tscn")

var player: Node2D

onready var grid: Grid = get_node("Grid") as Grid

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	setup_entities()
	

func setup_entities() -> void: 
	player = scene_snake.instance() as Node2D
	player.connect("move_triggered", self, "_on_Snake_move_triggered")
	add_child(player)
	grid.place_entity_at_random_pos(player)
	
	var food_instance: Node2D = scene_food.instance() as Node2D
	add_child(food_instance)
	grid.place_entity_at_random_pos(food_instance)

func _on_Snake_move_triggered(entity: Node2D, direction: Vector2) -> void:
	grid.move_entity_in_direction(entity, direction)
