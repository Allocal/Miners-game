class_name Player
extends RefCounted

var health: int = 100
var stamina: int = 100
var level: int = 1
var experience: float = 0.0
var skills: Dictionary = {}
var equipped_equipment: EquipmentBlueprint
var inventory: Inventory
