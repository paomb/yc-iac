## Docker image for Yandex Cloud Infrastructure
### Whats inside?
- Yandex Cloud CLI
- Kubectl
- Helm
- Terraform CLI
- bash
- ca-certificates
- openssl
- python3
- curl
- tar
- jq
- yq
- git

[Kubectl stable version](https://dl.k8s.io/release/stable.txt)  
[Terraform version list](https://releases.hashicorp.com/terraform/)

### How to build
Launch scripts
```
sh build.sh <new_image_tag> <push_to_docker_hub_y_or_n>
```

#### amd64 architecture 
docker buildx build --platform linux/amd64 -t paomb/yc-iac:$tag  .
### arm64 architecture
docker buildx build --platform linux/arm64 -t paomb/yc-iac:$tag-arm  .