extends Node2D

@export var value: int = 1
var collected: bool = false  # bandera de seguridad

func _on_area_2d_body_entered(body):
	if collected:
		return
	if body is Player:
		collected = true 
		$Area2D.monitoring = false  # 🔒 desactiva detección
		CollectiblesController.coin_collected(value)
		self.queue_free()
		
