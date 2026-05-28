run:
	podman run --rm -v $(PWD):/usr/share/nginx/html:ro -p 8080:80 docker.io/library/nginx:1.31-alpine

.PHONY: run
