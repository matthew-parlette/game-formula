# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "openra/map.jinja" import openra with context %}

{{ openra.server.image }}:
  dockerng.image_present

{{ openra.server.name }}:
  dockerng.running:
    - name: {{ openra.server.name }}
    - image: {{ openra.server.image }}
    - port_bindings:
      - {{ openra.server.port }}:1234
    - environment:
      - NAME: {{ openra.server.title|yaml_squote }}
      - ADVERTISE_ONLINE: {{ openra.server.advertise|yaml_squote }}
      - LOCK_BOTS: {{ openra.server.bots|yaml_squote }}
      - MOTD: {{ openra.server.motd|yaml_squote }}
      - MOD: {{ openra.server.mod|yaml_squote }}
      {%- if 'map' in openra.server %}
      - MAP: {{ openra.server.map|yaml_squote }}
      {%- endif %}
      {%- if 'password' in openra.server %}
      - PASSWORD: {{ openra.server.password|yaml_squote }}
      {%- endif %}
    - require:
      - dockerng: {{ openra.server.image }}
