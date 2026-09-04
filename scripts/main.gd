extends Control

# Временный тестовый скрипт для проверки генерации мира через Output.
# Позже заменится настоящим игровым экраном.
func _ready() -> void:
	var mountains: Biome = load("res://data/biomes/mountains.tres")
	var plains: Biome = load("res://data/biomes/plains.tres")
	var biomes: Array[Biome] = [mountains, plains]

	var region := WorldGenerator.generate_region(biomes)
	print("Region: ", region.display_name, " danger_level: ", region.danger_level)
	print("Composition: ", region.biome_composition)

	var location := WorldGenerator.generate_location(region, biomes)
	print("Location resources: ", location.resource_amounts)

	var obstacle_ids: Array[String] = []
	for obstacle in location.obstacles:
		obstacle_ids.append(obstacle.id)  # печатаем id, а не сами объекты — так нагляднее в консоли
	print("Location obstacles: ", obstacle_ids)



