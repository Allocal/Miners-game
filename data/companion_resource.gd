## Частый геологический спутник основного ресурса (например, серебро при меди).
## В отличие от BonusFind — физически присутствует почти всегда, вопрос только
## в том, получится ли его извлечь, и это зависит от навыка/техник, а не от удачи при генерации.
class_name CompanionResource
extends Resource

@export var resource_type: ResourceType
@export var base_extraction_chance: float = 0.05
