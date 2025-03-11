extends Node3D

@onready var mesh_instance = $MeshInstance3D

func _ready():
	var generator = MeshGenerator.new(PerlinNoise.new())
	var generated_mesh = generator.generate_mesh()
	mesh_instance.mesh = generated_mesh
	
