# Semi-Circular Motion: Illustrating Fleeforce-Polarisation

Credits first:
This program was created by "The Great Gravitator" for educational purposes.

This program is a simulation illustrating semi-circular motion with centrifugal force, showcasing the concept of Fleeforce-Polarisation. It utilizes OpenGL (Open Graphics Library) in C to visualize the motion of a mass within a semi-circular path and to demonstrate the effect of centrifugal force on the motion.

## Features

- **Semi-Circular Path:** The program displays a semi-circular path on the screen, representing the trajectory along which a mass moves.
  
- **Moving Mass:** A small mass moves along the semi-circular path, simulating semi-circular motion. The mass changes direction when it reaches the boundaries of the path.

- **Centrifugal Force Vector:** It calculates and visualizes the centrifugal force vector acting on the mass. This force is directed away from the center of rotation and is proportional to the square of the velocity of the mass and inversely proportional to the radius of the semi-circular path.

- **Fleeforce-Polarisation:** The simulation illustrates the concept of Fleeforce-Polarisation, showcasing how centrifugal force affects the motion and polarization of the mass within the semi-circular path.

- **Interactive Control:** Users can toggle clearing the screen using the spacebar and exit the program using the ESC key.

## How to Run

### Requirements

- OpenGL
- GLUT (OpenGL Utility Toolkit)
- C Compiler (e.g., GCC)

### Compilation

Ensure that you have OpenGL and GLUT installed on your system. Then, compile the program using a C compiler. For example:

```bash
gcc -o semi_circular_motion semi_circular_motion.c -lGL -lGLU -lglut -lm
```

