extends Area2D

class_name Door
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export (int) var destination_level
export (Vector2) var destination_position

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("doors") #consider setting persistent to true?

func _enter_tree():
	connect("body_entered", $"/root/Main/Level controller", "_on_door_entered", [self])

func _exit_tree():
	disconnect("body_entered", $"/root/Main/Level controller", "_on_door_entered")



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
