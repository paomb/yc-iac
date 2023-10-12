[[ -z "$1" ]] && { echo "Specify the tag for the new image!\nExisting tags:" && curl -L -s 'https://registry.hub.docker.com/v2/repositories/paomb/yc-iac/tags?page_size=1024' | jq '."results"[]["name"]' | sort ; exit 1; }
[[ -z "$2" ]] && { echo "Publish an image to hub.docker.com: y or n" ; exit 1; }
tag=$1
option=$2
docker buildx build --platform linux/amd64 -t paomb/yc-iac:$tag-amd64  .
docker buildx build --platform linux/arm64 -t paomb/yc-iac:$tag-arm64  .

case $option in 
y)
docker push paomb/yc-iac:$tag-amd64
docker push paomb/yc-iac:$tag-arm64
echo "docker run -ti --rm  paomb/yc-iac:$tag-amd64 bash"
echo "docker run -ti --rm  paomb/yc-iac:$tag-arm64 bash"
;;

n) echo "Образ не опубликован в hub.docker.com"
echo "docker run -ti --rm  paomb/yc-iac:$tag-amd64 bash"
echo "docker run -ti --rm  paomb/yc-iac:$tag-arm64 bash";;
esac