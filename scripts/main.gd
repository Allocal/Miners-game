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
	print("Location existing rare finds: ", location.existing_rare_finds)

	var obstacle_ids: Array[String] = []
	for obstacle in location.obstacles:
		obstacle_ids.append(obstacle.id)  # печатаем id, а не сами объекты — так нагляднее в консоли
	print("Location obstacles: ", obstacle_ids)

	var iron: ResourceType = load("res://data/resources/iron.tres")
	var coal: ResourceType = load("res://data/resources/coal.tres")
	var resource_types: Array[ResourceType] = [iron, coal]

	var player := Player.new()
	player.equipped_equipment = load("res://data/equipment/pickaxe.tres")

	var target_id := ""
	for resource_id in location.resource_amounts:
		target_id = resource_id
		break

	if target_id == "":
		print("В этой локации нечего копать")
		return

	print("Пробуем добыть: iron")
	var result := MiningResolver.attempt_mining(player, location, "iron", resource_types)
	print("Результат добычи: ", result)



