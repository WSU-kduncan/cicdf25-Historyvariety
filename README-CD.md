# Project 5
Brianna Perdue

## Project Details

### Project Description
This Project was used to create...

### EC2 Instance Details
| Detail                       |  Value                                                                  |
| ---------------------------- | ----------------------------------------------------------------------- |
| **AMI**                      |                         |
| **Instance Type**            | `t.2 medium`          |
| **Volume Size**              | 30 GB GP3            |
| **docker/login-action**      | Authenticates to our DockerHub repo using our repository secrets.                    |
| **docker/build-push-action** | Builds the Docker images from the repository code and then pushes them to our DockerHub repo. |
| **DockerHub**                | Stores and hosts our container images for any deployment or testing.            |
