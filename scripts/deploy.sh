#! /bin/bash

set -ex

DEPLOY_ENV="$1"
# echo $TRAVIS_BUILD_DIR

# TODO: staging environment
if [ "$DEPLOY_ENV" = "production" ]; then
  rsync -vzrlptD \
    --exclude .git \
    --exclude .gitignore \
    --exclude .travis.yml \
    --exclude node_modules \
    --exclude README.md \
    --exclude package.json \
    --exclude scripts \
    --delete-after \
    . root@154.12.237.243:/var/www/govobject-proposal/
fi
