# VoyantServer - Docker

This image provides [VoyantServer](https://github.com/sgsinclair/VoyantServer) and lets you host your own version of http://voyant-tools.org.

## Running

Fire up docker, map cotainer port 8080 to host port 8080.

```
$ docker run -d --name voyant -p 8080:8080 sepastian/voyant:latest
```

You can now access Voyant tools on your local machine at http://localhost:8080.

### Nginx

Next is an example configuration of Nginx to forward requests to your.server.com/voyant to http://localhost:8080. This may come in handy if you want to server Voyant tools to a broader public, on port 80 (HTTP) instead of port 8080 (which may be blocked by your firewall).

Note: the path `/voyant` cannot be changed, because Tomcat has been configured to server the Voyant app there. You are free to substitute any valid URL for your.server.com.

```
# /etc/nginx/sites-enabled/default, normally a symlink to /etc/nginx/sites-available/default

server {
  server_name your.server.com;
  
  # more options
  
  location /voyant {
    proxy_set_header Host $host;
    proxy_set_header X-Forwarded-Server $host;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_pass http://localhost:8080/voyant;
  }

  # other paths/sites.
}
```
