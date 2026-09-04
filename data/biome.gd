## Шаблон типа местности (горы, равнина и т.д.), задаёт какие ресурсы и опасности там водятся.
class_name Biome
extends Resource

@export var id: String
@export var display_name: String
@export var rock_type: String
@export var typical_resources: Array[ResourceType] = []
@export var typical_hazards: Array[ObstacleType] = []
