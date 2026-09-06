## Редкая "побочная" находка при добыче другого ресурса (например, уголь → вдруг алмаз).
class_name BonusFind
extends Resource

@export var resource_type: ResourceType
@export var chance: float = 0.02  # шанс срабатывания, от 0.0 до 1.0
@export var discovery_chance: float = 0.1  # шанс обнаружить её при попытке добычи, если существует — НЕ зависит от навыка