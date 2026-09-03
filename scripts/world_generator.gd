## Отвечает за процедурную генерацию мира: регионов и локаций.
class_name WorldGenerator
extends RefCounted

## Создаёт новый регион со случайным составом биомов.
## Порядок биомов перемешивается, затем каждому по очереди
## случайно достаётся доля от оставшегося бюджета (0-100%).
## Последний в перемешанном списке забирает весь остаток,
## чтобы сумма долей всегда была ровно 100.
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
			share = remaining  # последний биом забирает весь остаток
		elif remaining > 0.0:
			share = randf_range(0.0, remaining)
		region.biome_composition[biome.id] = share
		remaining -= share

	return region

## Генерирует конкретную локацию внутри региона: считает, сколько
## каждого типичного для присутствующих биомов ресурса там доступно.
## Пока НЕ генерирует препятствия — нет ни одного реального ObstacleType.
static func generate_location(region: Region, all_biomes: Array[Biome]) -> Location:
	var location := Location.new()
	location.region = region

	for biome_id in region.biome_composition:
		var share: float = region.biome_composition[biome_id]
		if share <= 0.0:
			continue

		var biome := _find_biome_by_id(all_biomes, biome_id)
		if biome == null:
			continue

		for resource_type in biome.typical_resources:
			# доля биома × случайный разброс, редкие ресурсы (высокий rarity) — меньше в итоге
			var amount := share * randf_range(0.5, 1.5) / resource_type.rarity
			var current: float = location.resource_amounts.get(resource_type.id, 0.0)
			location.resource_amounts[resource_type.id] = current + amount

	return location

## Ищет биом по его id в переданном списке. Возвращает null, если не найден.
static func _find_biome_by_id(biomes: Array[Biome], id: String) -> Biome:
	for biome in biomes:
		if biome.id == id:
			return biome
	return null
