docker-htpc-manager
===================

HTPC Manager daemon running in a container. The default paths have been altered to:

 * /config

The HTTP RPC interface is listening on TCP port `8085`.

Assumptions
-----------

All Docker configuration files are mounted from `/etc/docker/<container name>`.

Quick-start
-----------

`docker run -d --restart always -h htpcmanager --name htpcmanager -v /etc/docker/htpcmanager:/config -v /etc/localtime:/etc/localtime:ro -p 8085:8085 randomparity/docker-htpc-manager:latest`

Then open http://<docker host IP>:8085 in a browser to access the HTPC Manager web UI.

Details
-------

TBD
