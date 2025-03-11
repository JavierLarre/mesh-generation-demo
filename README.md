# Mesh Generation demo
## Credits
The script was taken from [this](https://glusoft.com/godot-tutorials/make-terrain-perlin-noise-FastNoiseLite/) tutorial, the following changes were made:

- The code was heavily refactorized from a single scripts to many scripts and classes
- Now the camera, light and enviroment are all added to a scene instead of instancing them on runtime. While this makes the code cleaner, it's harder to see the changes made to the nodes.
- Removed the array_mesh variable as it was unused and made no difference

## How to use
The main scene, [terrain_generation.tscn](./scenes/terrain_generation.tscn), contains the MeshGenerator and places the output mesh into the MeshInstance3D.
