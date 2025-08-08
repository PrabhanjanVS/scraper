#!/bin/bash
# This script deploys all manifests in your repo

REPO_URL="https://github.com/prabhanjan953/amazon-scraper-k8s.git"
CLONE_DIR="amazon-scraper-k8s"

# Clone if not there already
if [ ! -d "$CLONE_DIR" ]; then
  git clone $REPO_URL
fi

cd $CLONE_DIR

# Apply all manifests
find . -type f -name "*.yaml" ! -name "deployments.yaml|crawler.yaml" -exec kubectl apply -f {} \;
