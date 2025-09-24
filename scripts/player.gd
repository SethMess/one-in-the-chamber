extends CharacterBody2D

@onready var melee = $Melee
@onready var gun = $Gun

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
	print("melee")
	melee.attack()



func shoot():
	print("shooting")
	gun.shoot()
