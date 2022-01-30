extends TileMap

class_name Grid

# Declare member variables here. Examples:
onready var grid_size: Vector2 = Vector2(32,24)
var grid: Array
# Called when the node enters the scene tree for the first time.
func _ready():
	setup_grid()


func setup_grid() -> void:
	grid = []
	
	for x in range(grid_size.x):
		grid.append([])
		for y in range(grid_size.y):
			grid[x].append(null)


func get_entity_of_cell(grid_pos: Vector2) -> Node2D: 
	return grid[grid_pos.x][grid_pos.y] as Node2D


func set_entity_in_cell(entity: Node2D, grid_pos: Vector2) -> void:
	grid[grid_pos.x][grid_pos.y] = entity


func place_entity(entity: Node2D, grid_pos: Vector2) -> void:
	set_entity_in_cell(entity, grid_pos)
	entity.set_position(map_to_world(grid_pos))


func place_entity_at_random_pos(entity: Node2D) -> void:
	var has_random_pos: bool = false
	var random_grid_pos: Vector2
	
	while has_random_pos == false:
		var temp_pos: Vector2 = Vector2(randi() % int(grid_size.x) , randi() % int(grid_size.y))
		if get_entity_of_cell(temp_pos) == null:
			random_grid_pos = temp_pos
			has_random_pos = true

	place_entity(entity, random_grid_pos)

func move_entity_in_direction(entity: Node2D, direction: Vector2) -> void:
	var old_grid_pos: Vector2 = world_to_map(entity.position)
	var new_grid_pos: Vector2 = old_grid_pos + direction
	
	set_entity_in_cell(null, old_grid_pos)
	place_entity(entity, new_grid_pos)
