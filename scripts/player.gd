## Игрок: статы, инвентарь, экипировка. Создаётся и меняется только во время игры.
class_name Player
extends RefCounted

var health: int = 100
var stamina: int = 100
var level: int = 1
var experience: float = 0.0
var skills: Dictionary = {}  # ключ: ResourceType.id, значение: уровень навыка
var equipped_equipment: EquipmentBlueprint
var inventory: Inventory
