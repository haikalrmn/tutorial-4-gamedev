extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

export var sceneName: String = "Level1"
export var stringOutput: String = "You Win!"

func _on_ObjectiveArea_body_entered(body):
	if body.get_name() == "Player":
		print(stringOutput)
		get_tree().change_scene(str("res://scenes/" + sceneName + ".tscn"))
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
