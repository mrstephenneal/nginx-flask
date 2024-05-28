#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Optional TAG argument (if set, only the specified image will be built)
TAG=${1:-null}

# Check if the TAG variable is set
if [ "$TAG" != null ]

  # Only build & push one image
  then
    sh "${DIR}"/build.sh "${TAG}"

    FILE="${DIR}"/"${TAG}"/_docker-tags.txt

    # Check if image has multiple tags (indicated by file existence)
    if [ -f "${FILE}" ]; then
      echo "${TAG} directory has multiple Docker tags"

      while IFS= read -r line; do
        docker push stephenneal/nginx-flask:"${line}"
      done < "${DIR}"/"${TAG}"/_docker-tags.txt
    else
      docker push stephenneal/nginx-flask:"${TAG}"
    fi

  # Build & push all images
  else
    sh "${DIR}"/build.sh

    docker push stephenneal/nginx-flask:1.16-alpine
    docker push stephenneal/nginx-flask:1.16-alpine-v2
    docker push stephenneal/nginx-flask:1.17-alpine
    docker push stephenneal/nginx-flask:1.17-alpine-v2
    docker push stephenneal/nginx-flask:1.17-alpine-v3
    docker push stephenneal/nginx-flask:1.17-alpine-v4
    docker push stephenneal/nginx-flask:1.18-alpine
    docker push stephenneal/nginx-flask:1.19-alpine
    docker push stephenneal/nginx-flask:1.20-alpine
    docker push stephenneal/nginx-flask:1.21-alpine
    docker push stephenneal/nginx-flask:1.22-alpine
    docker push stephenneal/nginx-flask:1.23-alpine
    docker push stephenneal/nginx-flask:1.24-alpine
    docker push stephenneal/nginx-flask:1.25-alpine
    docker push stephenneal/nginx-flask:1.26-alpine
fi