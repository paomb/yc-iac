FROM alpine:3

ARG tf_ver=1.3.4
ARG kctl_ver=v1.25.4
ENV PATH=/opt/yandex-cloud/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN apk --update add bash ca-certificates openssl python3 curl tar jq yq git bash 
RUN curl https://storage.yandexcloud.net/yandexcloud-yc/install.sh | bash -s -- -i /opt/yandex-cloud -a
RUN curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
RUN curl "https://dl.k8s.io/release/${kctl_ver}/bin/linux/amd64/kubectl" -o /usr/local/bin/kubectl && chmod +x /usr/local/bin/kubectl
RUN curl -L "https://hashicorp-releases.yandexcloud.net/terraform/${tf_ver}/terraform_${tf_ver}_linux_amd64.zip" -o /tmp/terraform.zip && unzip /tmp/terraform.zip -d /usr/local/bin/ && rm -rf /tmp/terraform.zip