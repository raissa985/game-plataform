extends CharacterBody2D

var speed = 160
var jump_velocity = -500
var dir
var gravity = 980

var jumps = 1

var is_alive = true

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	
	move(delta)
	
	if is_alive:
		animations()
		
	pass
	
	fall()


func move(delta):
	
	if is_alive:
		dir = Input.get_axis("Left", "Right")
	
	if dir:
		velocity.x = dir * speed
	else:
		velocity.x = 0 
	
	if is_alive:
		if Input.is_action_just_pressed("Jump") and jumps> 0: 
			velocity.y = jump_velocity
			if jumps > 0:
				jumps -= 1 
	
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if is_on_floor():
		jumps = 1
	
	velocity.y += gravity * delta
	
	move_and_slide()
	
	pass


func animations():
	
	if velocity.x != 0 and is_on_floor():
		$AnimatedSprite2D.play("Run")
	elif velocity.x == 0 and is_on_floor():
		$AnimatedSprite2D.play("Idle")
	
	if not is_on_floor() and jumps >=1:
		$AnimatedSprite2D.play("Jump")
	
	
	if velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
	elif velocity.x < 0: 
		$AnimatedSprite2D.flip_h = true
	
	pass

func die():
	
	is_alive = false
	$AnimatedSprite2D.play("Hit")
	
	$CollisionShape2D.queue_free()
	$Area2D.queue_free()
	
	velocity.y = jump_velocity
	
	camera_zoom()

	pass
	
func camera_zoom():
	
	var zoom_value = 1.5
	
	$Camera2D.zoom = Vector2(zoom_value, zoom_value)
	Engine.time_scale = 0.5
	
	await get_tree().create_timer(0.8).timeout
	
	$Camera2D.zoom = Vector2(1 , 1)
	Engine.time_scale = 1
	
	await get_tree().create_timer(0.4).timeout
	
	get_tree().reload_current_scene()
	
	pass
	
func fall():
	
	if global_position.y >= 225 and is_alive:
		die()
	
	
	
	pass
