## Шаблон типа полезного ископаемого (руда, газ, жидкость и т.д.).
class_name ResourceType
extends Resource

@export var id: String
@export var display_name: String
@export var rarity: float = 1.0  # выше значение = реже встречается, снижает итоговое количество при добыче
@export var base_value: float = 1.0
