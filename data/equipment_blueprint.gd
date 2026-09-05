## Шаблон инструмента или промышленного оборудования.
class_name EquipmentBlueprint
extends Resource

@export var id: String
@export var display_name: String
@export var quality: float = 1.0
@export var max_durability: int = 100
@export var efficiency_by_resource: Array[ResourceEfficiency] = []
