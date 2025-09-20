extends CharacterBody2D

@onready var melee_area = $MeleeArea
@onready var melee_shape = $MeleeArea/CollisionShape2D
var speed = 400

func _physics_process(delta):
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * speed
	
	if Input.is_action_just_pressed("shoot"): #define these
		shoot()
	if Input.is_action_just_pressed("melee"): #define these
		melee_attack()
	
	look_at(get_global_mouse_position())
	move_and_slide()

func melee_attack():
	# Enable the hitbox
	melee_area.monitoring = true
	melee_shape.disabled = false
	
	# Play animation if you have one (optional)
	
	# Disable again after a short delay
	await get_tree().create_timer(0.2).timeout
	melee_area.monitoring = false
	melee_shape.disabled = true


func shoot():
	pass
