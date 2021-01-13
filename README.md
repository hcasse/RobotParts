# RobotParts

The pieces provided in this repository have been designed with [OpenSCAD](http://www.openscad.org/).
The models are assorted in order to be easily assembled

They are freely provided under the license ....

Most of the pieces can configured with a few parameters at the start of the model source:
* ``width`` - width of the piece in number of holes
* ``height`` - height of the piece in number of holes
* ``thickness`` - for board pieces, its thickness (in mm)
* ``hole`` - diameter of the hole (in mm, default to 4mm)
* ``pad`` - the padding space around the hole or between the holes (in mm, default to 2mm)

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
* ``rect_board.scad`` - rectangular board possibly used as base
* ``sensor.scad`` - fixation for [Pololu 3-IR ramp sensor ](https://www.pololu.com/product/2456/resources)
* ``wall.png`` - vertical structure to stack things (computer board, battery, etc)
