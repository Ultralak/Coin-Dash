extends Area2D
@onready var timer: Timer = $Timer
@onready var animated_sprite: AnimatedSprite2D = $"../AnimatedSprite2D"

var direction = 1

func _on_body_entered(body):
	if body.is_in_group("Player"):
		print("You died")
		Engine.time_scale = 0.5
		body.get_node("CollisionShape2D").queue_free()
		timer.start()
	else:
		direction*=-1
		animated_sprite.flip_h=!animated_sprite.flip_h
	

func _on_timer_timeout():
	Engine.time_scale = 1
	get_tree().reload_current_scene()
	
