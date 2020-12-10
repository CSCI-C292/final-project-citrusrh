extends Node



# Template: {Enum : [Name, Amplitude/Power, Cost, Type]}
export onready var CARDS_DATA = [["Attack", 10, 1, "Attack"], ["Heal", 10, 1, "Heal"]]

onready var deck = ["Attack","Attack","Heal","Attack","Heal","Attack","Heal","Heal"]

var maxMana = 3
var currentMana = 3

var cardsDrawn = 5
var drawPile = []
var hand = []
var discardPile = []

signal damageDealt(amount)
signal healthRestored(amount)

func _ready():
	pass

