## How to push to `index.docker.io`

```bash
$ export DOCKERHUB_AUTH="$(echo -n $DOCKER_HUB_REPOSITORY_USERNAME:$DOCKER_HUB_REPOSITORY_PASSWORD | base64)"
$ echo "{\"auths\":{\"https://index.docker.io/v1/\":{\"auth\":\"${DOCKERHUB_AUTH}\"}}}" > docker.json
$ docker run --rm -v $(pwd):/workspace -v $(pwd)/docker.json:/kaniko/.docker/config.json:ro gcr.io/kaniko-project/executor:v0.22.0 --context=dir:///workspace --dockerfile=Dockerfile --destination=${DOCKER_HUB_REPOSITORY_USERNAME}:${IMAGE_NAME}
```
