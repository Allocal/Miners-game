## Конкретное место добычи внутри региона.
class_name Location
extends RefCounted

var region: Region
var resource_amounts: Dictionary = {}  # ключ: ResourceType.id, значение: доступное количество
var obstacles: Array[ObstacleType] = []
