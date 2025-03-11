# Mesh Generation demo
Mesh generation script in godot using perlin noise with FastNoiseLite
## Credits
The script was taken from [this](https://glusoft.com/godot-tutorials/make-terrain-perlin-noise-FastNoiseLite/) tutorial, the following changes were made:

- The code was heavily refactorized from a single scripts to many scripts and classes
- Now the camera, light and enviroment are all added to a scene instead of instancing them on runtime. While this makes the code cleaner, it's harder to see the changes made to the nodes.
- Removed the array_mesh variable as it was unused and made no difference

## Scripts
I used two custom classes for this project
1. [PerlinNoise](https://github.com/JavierLarre/mesh-generation-demo/blob/master/scripts/perlin_noise.gd) is a FastNoiseLite object with perlin noise parameters. You may change those settings as you need.
2. [MeshGenerator](https://github.com/JavierLarre/mesh-generation-demo/blob/master/scripts/mesh_generator.gd) encapsules the generation logic. It recieves a FastNoiseLite object in the constructor to place the vertices.
