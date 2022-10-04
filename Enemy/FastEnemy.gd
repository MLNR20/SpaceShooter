extends Enemy


export var rotationRate := 20


func _process(delta):
	rotate(deg2rad(rotationRate) * delta)


func _on_FastEnemy_area_entered(area):
	pass # Replace with function body.
