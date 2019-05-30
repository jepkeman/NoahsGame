extends Node2D



func _on_player_downplat():
	$StaticBody2D/CollisionShape2D.disabled = true
	

