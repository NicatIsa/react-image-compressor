resource "aws_ecr_repository" "repository" {
  name = "react-image-compressor"
}

resource "aws_codebuild_project" "project" {
  name           = "react-image-compressor"
  description    = "CodeBuild project for react-image-compressor"
  service_role   = "aws_iam_role.codebuild_role.arn"
  build_timeout  = "5"
  queued_timeout = "5"

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "aws/codebuild/standard:5.0"
    type         = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"
  }

  source {
    type     = "GITHUB"
    location = "https://github.com/Rahul-Pandey7/react-image-compressor"
  }
}