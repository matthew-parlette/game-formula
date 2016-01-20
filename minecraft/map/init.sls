# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "minecraft/map/map.jinja" import minecraft with context %}

{{ minecraft.map.render.path }}:
  file.directory:
    - makedirs: True
