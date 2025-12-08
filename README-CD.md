# Project 5
Brianna Perdue

## Project Details

### Project Description
This Project was used to create...

### EC2 Instance Details
| Detail                       |  Value                                                                  |
| ---------------------------- | ----------------------------------------------------------------------- |
| **AMI**                      | Amazon Linux 2023: ami-0fa3fe0fa7920f68e                        |
| **Instance Type**            | t.2 medium          |
| **Volume Size**              | 30 GB GP3            |
| **Security Group — Inbound Rules**     |    Port 22 (SSH from my home IP), Port 80 (HTTP from anywhere),  Port 443 (for HTTPS)                 |
| **Security Group Purpose** | You only want the ports needed for admin access (SSH) and serving the web app (HTTP/HTTPS) open. |

### How to Set up Docker on your Instance

1. Connect to your EC2 instance using your private key: `ssh -i your-key.pem ec2-user@YOUR_EC2_PUBLIC_IP`
2. Update your packages with the command: `sudo dnf update -y`
3. Install Docker with the command: `sudo dnf install docker -y`
4. Start and enable Docker with commands: `sudo systemctl start docker` and `sudo systemctl enable docker`
5. Add your user to the Docker group, so you don't have to run commands with sudo: `sudo usermod -aG docker ec2-user`
6. Log out: `exit`
7. Log back in to see changes in effect: `ssh -i your-key.pem ec2-user@YOUR_EC2_PUBLIC_IP`
8. Test Docker installation with commands: `docker version` and `docker run hello-world`

### How to Test on the EC2 Instance

1. Pull your DockerHub image with the command: `docker pull historyvariety/project4:latest`
2. Run the container in interactive mode (-it) for testing with the command: `docker run -it historyvariety/project4:latest`
3. Run the container in detached mode (-d) for production with the command: `docker run -d --name project4-app -p 80:80 --restart always historyvariety/project4:latest`
4. Verify with either entering the command: `curl http://localhost` or opening your browser and going to `http://54.234.66.209`

**Difference between -it and -d:**


  - `-it`: Is interactive mode, very useful for debugging/testing containers and such.
  - `-d`: Is detached mode, runs in the background, more suitable for production.

### Script for Container Application Refresh
The `refresh.sh` script automates updating a Docker container to the latest tagged image on DockerHub. 
To do this, it stops the currently running container, removes the old container to free up the container name, and pulls the latest image from the DockerHub repository.
Finally, it runs a new container in detached mode.
