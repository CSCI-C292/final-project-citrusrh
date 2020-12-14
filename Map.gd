extends Node2D


func _ready():
	pass


func _on_Fight_pressed():
	get_tree().change_scene("res://Fight.tscn")


func _on_Boss_pressed():
	get_tree().change_scene("res://BossFight.tscn")
