FROM alpine

ENV KUBE_VERSION="v1.10.1"

RUN apk add --update ca-certificates \
 && apk add --update -t deps curl git \
 && curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBE_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
 && chmod +x /usr/local/bin/kubectl \
 && apk del --purge deps \
 && rm /var/cache/apk/* \
 && mkdir -p /root/.kube

WORKDIR /root
CMD ["sh"]
