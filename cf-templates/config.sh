#!/bin/bash

export GITHUB_USER=
export GITHUB_TOKEN=
# You can create your github token here: https://github.com/settings/tokens/new
# ( select scopes: "repo", "admin:repohook" )
# Warning: Don't reveal your Github token here

export GITHUB_REPO=node-petshop-api
export GITHUB_BRANCH=master

# Generate an unique S3 bucket name
export S3_BUCKET_NAME="node-petshop-api-$(aws sts get-caller-identity | jq -r .Account)"

export APP_FILE=node-petshop-api.zip
export INSTANCE_TYPE=t2.micro

export EBS_PLATFORM="64bit Amazon Linux 2 v3.1.0 running Docker"
export PROD_APP_NAME=ProdApp
export PROD_ENV_NAME=ProdEnv
export TEST_APP_NAME=TestApp
export TEST_ENV_NAME=TestEnv

export HEALTH_CHECK_PATH=/

export PROD_ENV_CNAME="node-petshop-api-${PROD_ENV_NAME}-${PROD_APP_NAME}"
export TEST_ENV_CNAME="node-petshop-api-${TEST_ENV_NAME}-${TEST_APP_NAME}"
