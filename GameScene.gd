extends Node2D

var CardTemplate = preload("res://Cards/Card.tscn")
var maxHandSize = 5

func _on_Draw_pressed():
	var i = 0
	while(i < CardManager.cardsDrawn):
		var nextCard = CardTemplate.instance()
		nextCard.rect_position = Vector2(10 + 200*i, 300)
		if($Hand.get_child_count() < maxHandSize):
			$Hand.add_child(nextCard)
			print("Drew a card")
		i += 1


func _on_EndTurn_pressed():
	if($Hand.get_child_count() != 0):
		for i in range(0, $Hand.get_child_count()):
			$Hand.get_child(i).queue_free()
			print("Discarded a card")
		
