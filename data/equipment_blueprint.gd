## Шаблон инструмента или промышленного оборудования.
class_name EquipmentBlueprint
extends Resource

@export var id: String
@export var display_name: String
@export var quality: float = 1.0
@export var max_durability: int = 100
@export var target_resource: ResourceType  # под добычу какого ресурса заточено это оборудование
