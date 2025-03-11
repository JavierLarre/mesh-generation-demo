extends Node3D

@onready var mesh_instance = $MeshInstance3D
@onready var noise = PerlinNoise.new()
@onready var surface_tool = SurfaceTool.new()

var width = 256
var depth = 256
var height = 50

func _ready():
	configure_surface_tool()
	var generated_mesh = surface_tool.commit()
	mesh_instance.mesh = generated_mesh
	
func configure_surface_tool():
	surface_tool.begin(Mesh.PRIMITIVE_TRIANGLES)
	for vertex in generate_vertices():
		surface_tool.add_vertex(vertex)
	connect_vertices()

func generate_vertices():
	var vertices = []
	for z in range(depth):
		for x in range(width):
			# EL ORDEN IMPORTA????
			vertices.append(create_vertex_from(x, z))
	return vertices
	
func create_vertex_from(x, z):
	return Vector3(
		x - width/2,
		noise.get_noise_2d(x, z) * height,
		z - depth/2
	)

func connect_vertices():
	# to form triangles
	for z in range(depth - 1):
		for x in range(width - 1):
			var idx = z * width + x
			surface_tool.add_index(idx)
			surface_tool.add_index(idx + 1)
			surface_tool.add_index(idx + width)
			
			surface_tool.add_index(idx + 1)
			surface_tool.add_index(idx + width + 1)
			surface_tool.add_index(idx + width)
