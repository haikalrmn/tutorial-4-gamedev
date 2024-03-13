extends KinematicBody2D

const UP = Vector2(0, -1)

export var speed: int = 400
export var GRAVITY: int = 1200
export var jump_speed: int = -400
export var slide_distance: int = 200
export var slide_speed: int = 50

var velocity: Vector2 = Vector2()


func get_input(_delta):
	velocity.x = 0
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = jump_speed
	if Input.is_action_pressed("right"):
		velocity.x += speed
	if Input.is_action_pressed("left"):
		velocity.x -= speed
		slide_distance = -slide_distance
		
	for i in range(get_slide_count() - 1):
		var collision = get_slide_collision(i)
		if collision.collider.name == "SlipperyPlatform":
			
			position.x = lerp(position.x, position.x + 1000, _delta)
	


func _physics_process(_delta):
	velocity.y += _delta * GRAVITY
	get_input(_delta)
	velocity = move_and_slide(velocity, UP, true)


func _process(_delta):
	if velocity.y != 0:
		$Animator.play("Jump")
	elif velocity.x != 0:
		$Animator.play("Walk")
		if velocity.x > 0:
			$Sprite.flip_h = false
		else:
			$Sprite.flip_h = true
	else:
		$Animator.play("Idle")
