FROM gcr.io/kaniko-project/executor:latest
FROM ubuntu:18.04

COPY --from=0 /kaniko/ /kaniko/

ENV HOME /root
ENV USER /root
ENV PATH /bin:/usr/bin:usr/local/bin:/kaniko
ENV SSL_CERT_DIR=/kaniko/ssl/certs
ENV DOCKER_CONFIG /kaniko/.docker/
ENV DOCKER_CREDENTIAL_GCR_CONFIG /kaniko/.config/gcloud/docker_credential_gcr_config.json

WORKDIR /workspace
