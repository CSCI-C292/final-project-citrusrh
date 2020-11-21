extends Node


enum CARDS {Attack, Defend}

# Template: {Enum : [Type, Amplitude/Power, Cost, Name]}
export onready var CARDS_DATA = {CARDS.Attack : ["Attack", 10, 1, "Attack"], CARDS.Defend : ["Defend", 10, 1, "Defend"]}

onready var deck = ["Attack","Attack","Attack","Attack","Defend","Defend","Defend","Defend"]

var cardsDrawn = 5
var drawPile = []
var hand = []
var discardPile = []

func _ready():
	pass