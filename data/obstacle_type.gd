## Шаблон препятствия при добыче (обвал, газ, поломка инструмента и т.д.).
class_name ObstacleType
extends Resource

@export var id: String
@export var is_permanent: bool = false
@export var prevalence: float = 0.3
@export var trigger_chance: float = 0.5
@export var min_damage: float = 5.0
@export var max_damage: float = 15.0
@export var detection_difficulty: float = 0.5
