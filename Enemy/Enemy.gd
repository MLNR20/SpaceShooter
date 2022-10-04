extends Area2D
class_name Enemy


onready var firingPositions := $FiringPositions
var plBullet := preload("res://Bullet/EnemyBullet.tscn")
var plEnemyExplosion := preload("res://Enemy/EnemyExplosion.tscn")

export var verticalSpeed := 10.0
export var health : int = 5
var playerInArea: Player= null

func _physics_process(delta):
	position.y += verticalSpeed * delta
	
func _process(delta):
	if playerInArea != null:
		playerInArea.damage(1)
		
func damage(amount : int):
	if health <=0:
		return
	
	health -= amount
	if health <=0:
		var effect := plEnemyExplosion.instance()
		effect.global_position = global_position
		get_tree().current_scene.add_child(effect)
		Signals.emit_signal("on_score_increment",1)
		queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Enemy_area_entered(area):
	if area is Player:
		playerInArea = area 

func _on_Enemy_area_exited(area):
	if area is Player:
		playerInArea = null


func fire():
	for child in firingPositions.get_children():
			var bullet := plBullet.instance()
			bullet.global_position = child.global_position
			get_tree().current_scene.add_child(bullet)
