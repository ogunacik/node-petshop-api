#!/bin/bash

source ./deploy.sh

aws s3 mb s3://${S3_BUCKET_NAME}
git archive -v -o /tmp/${APP_FILE} --format=zip HEAD
aws s3 cp /tmp/${APP_FILE} s3://${S3_BUCKET_NAME}

# Elastic Beanstalk Environments
aws cloudformation create-stack --stack-name node-petshop-api-ebs \
--template-body file://cf-templates/eb-apps.yaml \
--parameters \
ParameterKey=S3Bucket,ParameterValue="${S3_BUCKET_NAME}" \
ParameterKey=SourceS3Key,ParameterValue="${APP_FILE}" \
ParameterKey=EBProdCNAME,ParameterValue="${PROD_ENV_CNAME}" \
ParameterKey=EBTestCNAME,ParameterValue="${TEST_ENV_CNAME}" \
ParameterKey=EBProdAppName,ParameterValue="${PROD_APP_NAME}" \
ParameterKey=EBProdEnvName,ParameterValue="${PROD_ENV_NAME}" \
ParameterKey=EBTestAppName,ParameterValue="${TEST_APP_NAME}" \
ParameterKey=EBTestEnvName,ParameterValue="${TEST_ENV_NAME}" \
ParameterKey=ProdInstanceType,ParameterValue="${INSTANCE_TYPE}" \
ParameterKey=TestInstanceType,ParameterValue="${INSTANCE_TYPE}" \
ParameterKey=LBHealthCheckPath,ParameterValue="${HEALTH_CHECK_PATH}" \
ParameterKey=EBPlatform,ParameterValue="${EBS_PLATFORM}" \
--capabilities CAPABILITY_NAMED_IAM


# CodePipeline
aws cloudformation create-stack --stack-name node-petshop-api-cd-pipeline \
--template-body file://cf-templates/codepipeline.yaml \
--parameters \
ParameterKey=GitHubRepositoryName,ParameterValue="${GITHUB_REPO}" \
ParameterKey=GitHubUser,ParameterValue="${GITHUB_USER}" \
ParameterKey=GitHubBranch,ParameterValue="${GITHUB_BRANCH}" \
ParameterKey=GitHubToken,ParameterValue="${GITHUB_TOKEN}" \
ParameterKey=ArtifactBucket,ParameterValue="${S3_BUCKET_NAME}" \
ParameterKey=EBProdCNAME,ParameterValue="${PROD_ENV_CNAME}" \
ParameterKey=EBTestCNAME,ParameterValue="${TEST_ENV_CNAME}" \
ParameterKey=EBProdAppName,ParameterValue="${PROD_APP_NAME}" \
ParameterKey=EBProdEnvName,ParameterValue="${PROD_ENV_NAME}" \
ParameterKey=EBTestAppName,ParameterValue="${TEST_APP_NAME}" \
ParameterKey=EBTestEnvName,ParameterValue="${TEST_ENV_NAME}" \
--capabilities CAPABILITY_NAMED_IAM
