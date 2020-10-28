extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var level_paths = [
	"res://scenes/levels/Level1.tscn",
	"res://scenes/levels/Level2.tscn",
	"res://scenes/levels/Level3.tscn",
	]

var levels = {}
var current_level: Node;

const START_LEVEL = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(1, level_paths.size()+1):
		levels[i] = load(level_paths[i-1]).instance()
	_set_level(START_LEVEL)
	$Player.position = current_level.spawn_position
	$Player.paused = false
	$Player.doors_enabled = true

func _on_door_entered(body: Node, door: Door):
	if body == $Player and $Player.doors_enabled == true:
		$Player.doors_enabled = false
		print_debug("moving to level " + door.destination_level as String)
		$Player.paused = true
		call_deferred("remove_child", current_level)
		$Player.position = door.destination_position
		_set_level(door.destination_level)
		$Player.doors_enabled = false #I dont know why i need to do this again but
		$Player.paused = false

func _set_level(level_id: int):
	current_level = levels[level_id]#.instance()
	call_deferred("add_child", current_level)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
