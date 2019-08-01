# PDNS Manager Docker

docker image for [PDNS Manager](https://github.com/loewexy/pdnsmanager)

# Example

```yaml
version: "3"
services:
  pdnsmanager:
    image: maoxuner/pdnsmanager
    container_name: pdnsmanager
    ports:
      - 8080:80
```
