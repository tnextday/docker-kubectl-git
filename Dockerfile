FROM alpine

ARG KUBE_VERSION="v1.12.10"
ARG VCS_REF
ARG BUILD_DATE

LABEL org.label-schema.version=$KUBE_VERSION \
    org.label-schema.name="kubectl-git" \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.build-date=$BUILD_DATE \
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
