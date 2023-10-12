[[ -z "$1" ]] && { echo "Укажи тег для нового образа!\nСуществующие теги:" && curl -L -s 'https://registry.hub.docker.com/v2/repositories/paomb/yc-iac/tags?page_size=1024' | jq '."results"[]["name"]' ; exit 1; }
[[ -z "$2" ]] && { echo "Опубликовать образ в hub.docker.com: y or n" ; exit 1; }
tag=$1
option=$2
docker buildx build --platform linux/amd64 -t paomb/yc-iac:$tag  .
docker buildx build --platform linux/arm64 -t paomb/yc-iac:$tag-arm  .

case $option in 
y)
docker push paomb/yc-iac:$tag
docker tag paomb/yc-iac:$tag paomb/yc-iac:latest
docker tag paomb/yc-iac:$tag-arm paomb/yc-iac:arm
docker push paomb/yc-iac:latest
docker push paomb/yc-iac:arm
echo "docker run -ti --rm  paomb/yc-iac:latest bash"
;;
n) echo "Образ не опубликован в hub.docker.com"
echo "docker run -ti --rm  paomb/yc-iac:$tag bash"
;;
esac