# Mesh Generation demo
Mesh generation script in godot using perlin noise with FastNoiseLite

## Scripts
I used two custom classes for this project:
1. [PerlinNoise](https://github.com/JavierLarre/mesh-generation-demo/blob/master/scripts/perlin_noise.gd) is a FastNoiseLite object with perlin noise parameters. You may change those settings as you need.
2. [MeshGenerator](https://github.com/JavierLarre/mesh-generation-demo/blob/master/scripts/mesh_generator.gd) encapsules the generation logic. It recieves a FastNoiseLite object in the constructor to place the vertices.

Plus, there are two scenes:
1. [noise_test](https://github.com/JavierLarre/mesh-generation-demo/blob/master/scenes/noise_test.tscn) just outputs a 2d image generated with perlin noise.
2. [terrain_generation](https://github.com/JavierLarre/mesh-generation-demo/blob/master/scenes/terrain_generation.tscn) is the main scene containing the mesh generation. This is different to MeshGenerator, so better naming is needed.

## Credits
The script was taken from [this tutorial](https://glusoft.com/godot-tutorials/make-terrain-perlin-noise-FastNoiseLite/), but the following changes were made:

- The code was heavily refactorized from a single scripts to many scripts and classes. The generation logic was encapsulated into [MeshGenerator](https://github.com/JavierLarre/mesh-generation-demo/blob/master/scripts/mesh_generator.gd).
- The camera, light and enviroment were added as nodes to the main scene instead of instancing them on runtime. While this makes the code cleaner, it's harder to see the changes made to the nodes.
- Removed the array_mesh variable from the tutorial as it was unused and made no difference.
