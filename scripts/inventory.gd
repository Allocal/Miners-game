## Хранилище ресурсов и оборудования игрока.
class_name Inventory
extends RefCounted

var resources: Dictionary = {}  # ключ: ResourceType.id, значение: количество (float)
var equipment: Array[EquipmentBlueprint] = []
