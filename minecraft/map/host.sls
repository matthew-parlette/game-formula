# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "minecraft/map/map.jinja" import minecraft with context %}

include:
  - minecraft.map

nginx:
  dockerng.image_present

minecraft-map-host:
  dockerng.running:
    - name: minecraft-map-host
    - image: nginx
    - port_bindings:
      - 8001:80
    - binds:
      - {{ minecraft.map.render.path }}:/usr/share/nginx/html:ro
    - require:
      - file: {{ minecraft.map.render.path }}
      - dockerng: nginx
