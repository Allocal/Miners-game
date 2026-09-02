class_name WorldGenerator
extends RefCounted

static func generate_region(available_biomes: Array[Biome]) -> Region:
	var region := Region.new()
	region.id = "region_" + str(randi())
	region.display_name = "Generated Region"

	var shuffled := available_biomes.duplicate()
	shuffled.shuffle()

	var remaining := 100.0
	for i in range(shuffled.size()):
		var biome: Biome = shuffled[i]
		var share := 0.0
		if i == shuffled.size() - 1:
			share = remaining
		elif remaining > 0.0:
			share = randf_range(0.0, remaining)
		region.biome_composition[biome.id] = share
		remaining -= share

	return region
