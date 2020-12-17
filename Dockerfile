FROM alpine:3

ARG KUBE_VERSION="v1.18.13"

LABEL org.label-schema.version=$KUBE_VERSION \
    org.label-schema.name="kubectl-git" \
    org.label-schema.vcs-url="https://github.com/tnextday/kubectl-git"

RUN apk add --update ca-certificates \
 && apk add --update curl git \
 && curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBE_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
 && chmod +x /usr/local/bin/kubectl \
 && apk del --purge curl \
 && rm /var/cache/apk/* \
 && mkdir -p /root/.kube

WORKDIR /root
CMD ["sh"]
