## Шаблон препятствия при добыче (обвал, газ, поломка инструмента и т.д.).
class_name ObstacleType
extends Resource

@export var id: String
@export var is_permanent: bool = false  # всегда присутствует в локации, а не появляется случайно
@export var min_damage: float = 5.0
@export var max_damage: float = 15.0
@export var detection_difficulty: float = 0.5  # выше значение = сложнее обнаружить заранее
