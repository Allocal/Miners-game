## Именованная техника — то, что реально видит игрок вместо голого уровня навыка.
## Открывается при достижении скрытого порогового уровня Player.skills для конкретного ресурса.
class_name Technique
extends Resource

@export var id: String
@export var display_name: String
@export var description: String  # текст при открытии, например "Ты научился распознавать трещины в граните"
@export var resource_type: ResourceType
@export var unlock_threshold: int = 5  # скрытый уровень навыка, при достижении которого открывается
@export var effect_type: String  # метка эффекта: "quantity_bonus", "quality_bonus", "detection_bonus" и т.д.
@export var effect_value: float = 0.05
