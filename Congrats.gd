extends Control


func _ready():
	pass


func _on_Yes_pressed():
	CardManager.deck = ["Attack","Attack","Attack","Attack","Heal","Heal","Heal","Heal"]
	get_tree().change_scene("res://Map.tscn")


func _on_No_pressed():
	get_tree().quit()
