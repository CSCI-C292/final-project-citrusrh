extends MarginContainer


func _ready():
	if(CardManager.drawPile.size() > 0):
		var cardDrawn = CardManager.drawPile.pop_front()
		$Name.text = cardDrawn
		CardManager.hand.append(cardDrawn)
	else:
		CardManager.drawPile = CardManager.discardPile
		CardManager.discardPile = []
		$Name.text = CardManager.drawPile.pop_front()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_PlayCard_pressed():
	if(CardManager.currentMana > 0):
		CardManager.currentMana -= 1
		print("Played " + $Name.text)
		CardManager.discardPile.append($Name.text)
		CardManager.hand.remove(CardManager.hand.find($Name.text))
		self.queue_free()
