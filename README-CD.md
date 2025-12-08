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

### How to Set-up Docker on your Instance

1. Connect to your EC2 instance using your private key: `ssh -i your-key.pem ec2-user@YOUR_EC2_PUBLIC_IP`
2. Update your packages with command: `sudo dnf update -y`
3. Install Docker with command: `sudo dnf install docker -y`
4. Start and Enable docker with commands: `sudo systemctl start docker` and `sudo systemctl enable docker`
5. Add your user to the docker group, so you don't have to run commands with sudo: `sudo usermod -aG docker ec2-user`
6. Log out: `exit`
7. Log back in to see changes in effect: `ssh -i your-key.pem ec2-user@YOUR_EC2_PUBLIC_IP`
8. Test Docker installation with commands: `docker version` and `docker run hello-world`
