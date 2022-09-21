# RobotParts

The pieces provided in this repository have been designed with [OpenSCAD](http://www.openscad.org/).
The models are assorted in order to be easily assembled

They are freely provided under the license ....


# Configuration

The set of pieces proposed in this package are assorted and configurable.
The default configuration `config.scad` copies the configuration `M4.scad` from `configs`directory. This configurations support holes for M4 screws (4mm diameter).

To switch to a new configuration `config/XXX.scad`, just copy it to `config.scad`:
```
	cp config/XXX.scad config.scad
```

For now, only `M4.scad`is provided but more will be added later.



# Generating a piece in OpenSCAD

1. Launch **OpenScad**.

2. To build a model _MODEL_ , type the following **OpenScad** code:
```
use <MODEL_DIRECTORY/MODEL.scad>

MODEL(PARAM1=VALUE1, PARAM2=VALUE2, ...);
```

3. Parameters depends on the type of model. To get the parameter of a model, you can look to the file `MODEL_DIRECTORY/MODEL.md`.

4. Save this model in the *RobotParts* directory.

5. Select the `Insight`menu (F5).

Now you can use all options of **OpenSCad** to generate your STL output
and to play with parameters.









Most of the pieces can configured with a few parameters at the start of the model source:
* ``width`` - width of the piece in number of holes
* ``height`` - height of the piece in number of holes
* ``thickness`` - for board pieces, its thickness (in mm)
* ``hole`` - diameter of the hole (in mm, default to 4mm)
* ``space`` - inter-hole space (in mm, default to 4mm)
* ``pad`` - the padding space around the hole or between the holes (in mm, default to 2mm)

The following formula is applied to convert a number of points *n* into a size *s* in mm:

    *s = n * hole + (n - 1) * space + 2 * pad*

For converting a size *s* in mm into the closest bigger number of holes:

    *n = ceil((s - 2*pad + space) / (hole + space))* 


The following pieces are available:
* ``angle.scad`` - plate angle for 3D assembly
* ``barre_trouee.scad`` - bar for robot skeleton
* ``base.scad`` - octogonal base board
* ``box.scad`` - simple open box (no hole)
* ``butee.scad`` - square piece to block something (computer board, battery, etc)
* ``fixation.scad`` - vertical fixation provided free position selection using screws
* ``fixing_square`` - square designed to assemble ``barre_trouee.scad``
* ``jonction_place_param.scad`` - straight fixation to assemble ``barre_trouee.scad``
* ``moteur.scad``, ``moteur2.scad`` - left and right fixation for [Dagu DG01D CC motor](http://www.dagurobot.com/DG01D-L)
* ``plate_square.scad`` - plate square to connect ``barre_trouee.scad``
* ``rect_board.scad`` - rectangular board possibly used as base
* ``sensor.scad`` - fixation for [Pololu 3-IR ramp sensor ](https://www.pololu.com/product/2456/resources)
* ``wall.png`` - vertical structure to stack things (computer board, battery, etc)
