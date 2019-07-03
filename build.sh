#!/usr/bin/env bash

declare -a VERSIONS=('5.6-apache' '7.1-cli' '7.1-fpm' '7.1-apache' '7.2-cli' '7.2-fpm' '7.2-apache')

for i in "${VERSIONS[@]}"
do
  BUILD_ARGS=""

  if [[ -n "$http_proxy" ]]; then
    BUILD_ARGS="${BUILD_ARGS} --build-arg http_proxy=${http_proxy}"
  fi

  if [[ -n "$https_proxy" ]]; then
    BUILD_ARGS="${BUILD_ARGS} --build-arg https_proxy=${https_proxy}"
  fi

  docker build ${BUILD_ARGS} -t unixslayer/php:${i} ./dist/${i}
done