================
game-formula
================

Formula for game servers and clients.

Available States
================

.. contents::
    :local:

``openra.server``
-----------------

Download and run an [OpenRA](http://www.openra.net) dedicated server as a docker container.

Be sure to forward port 1234 to this server.

``minecraft.server``
--------------------

Run a minecraft server in a docker container.

This uses port 25565 by default.

``minecraft.map.host``
----------------------

Host the rendered minecraft map via nginx in a container.

``minecraft.map.render``
------------------------

Spawn a container to render the current minecraft map.
