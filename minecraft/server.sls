# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "minecraft/map.jinja" import minecraft with context %}

{{ minecraft.server.path }}:
  file.directory:
    - makedirs: True

{{ minecraft.server.image }}:
  dockerng.image_present

{{ minecraft.server.name }}:
  dockerng.running:
    - name: {{ minecraft.server.name }}
    - image: {{ minecraft.server.image }}
    - port_bindings:
      - {{ minecraft.server.port }}:25565
    - binds:
      - {{ minecraft.server.path }}:/data
    - environment:
      - EULA: 'TRUE'
      - OPS: {{ minecraft.server.ops|yaml_squote }}
      - MODE: {{ minecraft.server.mode|yaml_squote }}
      - MOTD: {{ minecraft.server.motd|yaml_squote }}
      - PVP: {{ minecraft.server.pvp|yaml_squote }}
      - VERSION: {{ minecraft.server.version|yaml_squote }}
    - require:
      - file: {{ minecraft.server.path }}
      - dockerng: {{ minecraft.server.image }}
