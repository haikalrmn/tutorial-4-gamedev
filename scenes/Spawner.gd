extends Node2D


export (PackedScene) var obstacle
export var spawnTimeMin: float = 0.2
export var spawnTimeMax: float = 1

func _ready():
	repeat()

func spawn():
	var spawned = obstacle.instance()
	get_parent().add_child(spawned)

	var spawn_pos = global_position
	spawn_pos.x = spawn_pos.x

	spawned.global_position = spawn_pos

func repeat():
	spawn()
	yield(get_tree().create_timer(rand_range(spawnTimeMin, spawnTimeMax)), "timeout")
	repeat()
