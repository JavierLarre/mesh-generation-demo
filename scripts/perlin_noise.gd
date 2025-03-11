extends FastNoiseLite
class_name PerlinNoise

const FREQ = 0.02
const OCTAVES = 15

func _init() -> void:
	noise_type = FastNoiseLite.TYPE_PERLIN
	fractal_type = FastNoiseLite.FRACTAL_FBM
	frequency = FREQ
	fractal_octaves = OCTAVES
