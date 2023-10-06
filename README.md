# Bludit container image
Das offizielle bludit container image docker.io/bludit/docker ist etwas veraltet.  
Deshalb habe ich basierend auf docker.io/trafex/php-nginx:3.4.0 ein eigenes erstellt.  
Es enthält nginx 1.24, PHP-FPM 8.2 und natürlich die aktuelle bludit version 3.15.0.  

# Build

```bash
podman build -t bludit:3.15.0 .
```

# Run 
```bash
podman run -p 8080:8080 -v bl-content:/var/www/html/bl-content bludit:3.15.0
```
