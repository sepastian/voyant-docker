# VoyantServer - Docker

## Running

Fire up docker, map cotainer port 8080 to host port 8080.
Voyant will be listening for requests on http://localhost:8080.

$ docker run -d --name voyant -p 8080:8080 sepastian/voyant:2.2M2

### Nginx

Optionally, configure Nginx to pass on requests to
your.server.com/voyant to voyant tools at http://localhost:8080.

Note: the path `/voyant` cannot be changed, because Tomcat has
been configured to server the Voyant app there. You are free to
substitute any valid URL for your.server.com.

```
# /etc/nginx/sites-enabled/default

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
