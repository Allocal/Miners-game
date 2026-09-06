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
