## Сгенерированный при старте игры регион со случайным составом биомов.
## НЕ шаблон — создаётся заново в каждой партии, не сохраняется как .tres.
class_name Region
extends RefCounted

var id: String
var display_name: String
var biome_composition: Dictionary = {}  # ключ: Biome.id, значение: доля региона в % (сумма = 100)
var min_depth: float = 0.0
var max_depth: float = 100.0
