extends MarginContainer


func _ready():
	if(CardManager.drawPile.size() > 0):
		var cardDrawn = CardManager.drawPile.pop_front()
		$Name.text = cardDrawn
		CardManager.hand.append(cardDrawn)
	else:
		CardManager.drawPile = CardManager.discardPile
		CardManager.discardPile = []
		var cardDrawn = CardManager.drawPile.pop_front()
		$Name.text = cardDrawn
		CardManager.hand.append(cardDrawn)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_PlayCard_pressed():
	if(CardManager.currentMana > 0):
		CardManager.currentMana -= 1
		print("Played " + $Name.text)
		for i in CardManager.CARDS_DATA:
			if i[0] == $Name.text:
				if i[3] == "Attack":
					var amount = i[1]
					CardManager.emit_signal("damageDealt", amount)
				if i[3] == "Heal":
					var amount = i[1]
					CardManager.emit_signal("healthRestored", amount)
		CardManager.discardPile.append($Name.text)
		CardManager.hand.remove(CardManager.hand.find($Name.text))
		self.queue_free()
