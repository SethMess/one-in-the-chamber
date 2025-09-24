class_name Bullet
extends Node2D

@export var speed: float = 500.0
@export var damage: int = 1

var direction: Vector2 = Vector2.ZERO  # set this when fired

func _ready() -> void:
	# Auto-despawn after 2s
	$Timer.start(2.0)

func _physics_process(delta: float) -> void:
	position += direction * speed * delta

func _on_body_entered(body: Node) -> void:
	if body.has_method("take_damage"):
		body.take_damage(damage)
	queue_free()

func _on_Timer_timeout() -> void:
	queue_free()
