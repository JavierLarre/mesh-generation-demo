extends Node2D

@onready var noise = PerlinNoise.new()
@onready var sprite = $Sprite2D
const IMAGE_SIZE = 1024

func _ready() -> void:
	var noise_image = noise.get_image(IMAGE_SIZE, IMAGE_SIZE)
	sprite.texture = ImageTexture.create_from_image(noise_image)
