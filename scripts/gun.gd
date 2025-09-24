class_name Gun
extends Node2D

@onready var bullet_scene: PackedScene = load("res://scenes/bullet.tscn")

@export var fire_rate: float = 0.1
var can_shoot: bool = true

func shoot() -> void:
	if not can_shoot:
		return
	
	can_shoot = false
	await get_tree().create_timer(fire_rate).timeout
	can_shoot = true
	
	var bullet: Bullet = bullet_scene.instantiate()
	get_tree().current_scene.add_child(bullet)
	bullet.global_position = $muzzle.global_position
	bullet.direction = transform.x.normalized() # fire in gun's facing directions
