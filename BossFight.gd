extends Node2D

var CardTemplate = preload("res://Cards/Card.tscn")
var maxHandSize = 5

var playerMaxHealth = 100
var playerCurrentHealth = 100
var enemyMaxHealth = 100
var enemyCurrentHealth = 100

func _ready():
	CardManager.connect("damageDealt", self, "_on_damageDealt")
	CardManager.connect("healthRestored", self, "_on_healthRestored")


func _enter_tree():
	enemyCurrentHealth = enemyMaxHealth
	CardManager.drawPile = CardManager.deck.duplicate()
	randomize()
	CardManager.drawPile.shuffle()
	CardManager.discardPile = []
	CardManager.hand = []
	var i = 0
	while(i < CardManager.cardsDrawn):
		var nextCard = CardTemplate.instance()
		nextCard.rect_position = Vector2(10 + 200*i, 300)
		if($Hand.get_child_count() < maxHandSize):
			$Hand.add_child(nextCard)
			print("Drew a card")
		i += 1


func _process(delta):
	$PlayerHealth.text = "Player HP: " + str(playerCurrentHealth) + "/" + str(playerMaxHealth)
	$EnemyHealth.text = "Boss HP: " + str(enemyCurrentHealth) + "/" + str(enemyMaxHealth)
	$Mana.text = "Mana: " + str(CardManager.currentMana)


func _on_EndTurn_pressed():
	if($Hand.get_child_count() != 0):
		for i in range(0, $Hand.get_child_count()):
			$Hand.get_child(i).queue_free()
			print("Discarded a card")
		while CardManager.hand.size() > 0:
			CardManager.discardPile.append(CardManager.hand.pop_front())
	var i = 0
	var cardsRemaining = $Hand.get_child_count()
	while(i < CardManager.cardsDrawn):
		var nextCard = CardTemplate.instance()
		nextCard.rect_position = Vector2(10 + 200*i, 300)
		if($Hand.get_child_count() < maxHandSize + cardsRemaining):
			$Hand.add_child(nextCard)
			print("Drew a card")
		i += 1
	CardManager.currentMana = CardManager.maxMana
	playerCurrentHealth -= 30
	print("Boss applies 30 damage to player.")
	if playerCurrentHealth <= 0:
		get_tree().change_scene("res://GameOver.tscn")


func _on_damageDealt(amount):
	enemyCurrentHealth -= amount
	if enemyCurrentHealth <= 0:
		_on_EndTurn_pressed()
		get_tree().change_scene("res://Congrats.tscn")


func _on_healthRestored(amount):
	playerCurrentHealth += amount
	if playerCurrentHealth > playerMaxHealth:
		playerCurrentHealth = playerMaxHealth
