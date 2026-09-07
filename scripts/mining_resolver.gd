## Отвечает за разрешение попытки добычи ресурса.
class_name MiningResolver
extends RefCounted

## Модификатор эффективности в зависимости от текущей выносливости игрока.
static func _stamina_modifier(stamina: int) -> float:
	if stamina >= 75:
		return 1.0
	elif stamina >= 50:
		return 0.9
	elif stamina >= 25:
		return 0.7
	elif stamina >= 1:
		return 0.5
	else:
		return 0.0

## Ищет множитель эффективности инструмента для конкретного ресурса.
## Если инструмент не заточен именно под этот ресурс — возвращает
## заниженный базовый множитель (может копать всё, но плохо).
static func _equipment_efficiency(equipment: EquipmentBlueprint, resource_type: ResourceType) -> float:
	for entry in equipment.efficiency_by_resource:
		if entry.resource_type.id == resource_type.id:
			return entry.multiplier
	return 0.3


## Обрабатывает одну попытку добычи конкретного ресурса в конкретной локации.
static func attempt_mining(player: Player, location: Location, target_resource_id: String, all_resource_types: Array[ResourceType]) -> Dictionary:
	var remaining: float = location.resource_amounts.get(target_resource_id, 0.0)

	if remaining <= 0.0:
		return {"success": false, "reason": "empty"}
	
	var resource_type: ResourceType = _find_resource_type_by_id(target_resource_id, all_resource_types)
	var stamina_mod := _stamina_modifier(player.stamina)

	if stamina_mod <= 0.0:
		return {"success": false, "reason": "exhausted"}

	var equipment_mod := _equipment_efficiency(player.equipped_equipment, resource_type)
	var skill_level: int = player.skills.get(target_resource_id, 0)
	var skill_quantity_mod := 1.0 + (skill_level * 0.015)
	var skill_quality_mod := 1.0 + (skill_level * 0.015)

	var rng_mod := randf_range(0.85, 1.15)
	var extraction_percent := randf_range(0.05, 0.15)
	var extracted := remaining * extraction_percent

	var waste_ratio: float = clamp(0.4 - (skill_level * 0.01), 0.1, 0.4)
	var waste := extracted * waste_ratio
	var ore_amount := extracted - waste

	location.resource_amounts[target_resource_id] = remaining - extracted

	player.stamina = max(0, player.stamina - 2)

	var durability: int = player.equipment_durability.get(player.equipped_equipment.id, player.equipped_equipment.max_durability)
	durability = max(0, durability - 1)
	player.equipment_durability[player.equipped_equipment.id] = durability

	var found_rare: Array[String] = []
	for bonus in resource_type.rare_bonus_finds:
		if randf() < bonus.discovery_chance:
			found_rare.append(bonus.resource_type.id)

	var found_companions: Array[String] = []
	for companion in resource_type.companion_resources:
		var companion_chance := companion.base_extraction_chance + (skill_level * 0.01)
		if randf() < companion_chance:
			found_companions.append(companion.resource_type.id)

	return {
		"success": true,
		"ore_amount": ore_amount,
		"waste_amount": waste,
		"quantity_multiplier": stamina_mod * equipment_mod * skill_quantity_mod * rng_mod,
		"quality_multiplier": skill_quality_mod,
		"rare_finds": found_rare,
		"companion_finds": found_companions
	}

	

static func _find_resource_type_by_id(resource_id: String, all_resource_types: Array[ResourceType]) -> ResourceType:
	for resource_type in all_resource_types:
		if resource_type.id == resource_id:
			return resource_type
	
	return null