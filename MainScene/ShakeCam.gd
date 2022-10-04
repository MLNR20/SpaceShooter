extends Camera2D

var shakeAmount := 0.0

export var baseAmount := 1.0
export var shakeDampening := 0.075


func _process(delta):
	if shakeAmount > 0:
		position.x= rand_range(-baseAmount,  baseAmount) * shakeAmount
		position.y= rand_range(-baseAmount,  baseAmount) * shakeAmount
		shakeAmount = lerp(shakeAmount, 0.0, shakeDampening)
	else:
		position = Vector2(0,0)
	
func shake(magnitude: float):
	shakeAmount += magnitude
