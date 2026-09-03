extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var mountains: Biome = load("res://data/biomes/mountains.tres")
	var plains: Biome = load("res://data/biomes/plains.tres")
	var biomes: Array[Biome] = [mountains, plains]

	var region := WorldGenerator.generate_region(biomes)
	print("Region: ", region.display_name)
	print("Composition: ", region.biome_composition)

	var location := WorldGenerator.generate_location(region, biomes)
	print("Location resources: ", location.resource_amounts)



