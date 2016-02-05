# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "minecraft/map/map.jinja" import minecraft with context %}

include:
  - minecraft.map

minecraft-map-render-server-path:
  file.directory:
    - name: {{ minecraft.server.path }}
    - makedirs: True

davenonne/mapcrafter:
  dockerng.image_present

minecraft-map-render:
  dockerng.running:
    - name: minecraft-map-render
    - image: davenonne/mapcrafter
    - binds:
      - {{ minecraft.server.path }}/world:/world
      - {{ minecraft.map.render.path }}:/www
    - require:
      - file: minecraft-map-render-server-path
      - file: {{ minecraft.map.render.path }}
      - dockerng: davenonne/mapcrafter
