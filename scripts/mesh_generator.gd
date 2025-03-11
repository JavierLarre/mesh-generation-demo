extends Node
class_name MeshGenerator

var width = 256
var depth = 256
var height = 50

var noise: FastNoiseLite
var generated_mesh: ArrayMesh
var surface_tool: SurfaceTool

func _init(noise: FastNoiseLite = null) -> void:
	self.noise = noise
	surface_tool = SurfaceTool.new()

func get_generated_mesh() -> ArrayMesh:
	return generated_mesh

func generate_mesh() -> ArrayMesh:
	configure_surface_tool()
	generated_mesh = surface_tool.commit()
	return generated_mesh

func configure_surface_tool() -> void:
	surface_tool.begin(Mesh.PRIMITIVE_TRIANGLES)
	for vertex in generate_vertices():
		surface_tool.add_vertex(vertex)
	connect_vertices()

func generate_vertices() -> Array[Vector3]:
	var vertices: Array[Vector3] = []
	for z in range(depth):
		for x in range(width):
			vertices.append(create_vertex_from_noise(x, z))
	return vertices
	
func create_vertex_from_noise(x, z) -> Vector3:
	var noise_value := noise.get_noise_2d(x, z)
	return Vector3(
		x - width/2,
		height * noise_value,
		z - depth/2
	)

func connect_vertices() -> void:
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
