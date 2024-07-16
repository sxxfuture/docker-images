FROM ghcr.io/netbox-community/netbox:v3.7.8-2.8.0

# override TableExport with utf-8-sig encoding
COPY ./v3.7.8/bulk_views.py /opt/netbox/netbox/netbox/views/generic/

COPY ./v3.7.8/plugin_requirements.txt /opt/netbox/
COPY ./v3.7.8/plugins.py /etc/netbox/config/plugins.py

RUN /opt/netbox/venv/bin/pip install --no-warn-script-location -r /opt/netbox/plugin_requirements.txt
