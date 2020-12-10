extends Control


func _ready():
	pass


func _on_Attack_pressed():
	CardManager.deck.append("Attack")
	get_tree().change_scene("res://Map.tscn")


func _on_Heal_pressed():
	CardManager.deck.append("Heal")
	get_tree().change_scene("res://Map.tscn")
