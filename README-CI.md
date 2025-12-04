# Project 4 - Continuous Integration
Brianna Perdue

## Details

### Project Description
This Project was used to create...


### Dockerfile and Website Content

#### What is a Dockerfile? And what are the contents of the Dockerfile in this Repository?

- A Dockerfile is: "*A Dockerfile is a text file containing instructions for building source code, crucial for automated, multi-layer image builds.*"(4)


#### What is this Website? And what are the contents?

- [web-content folder](web-content) - contains the files to portray a beach-themed website, created by Chat.gpt using the prompt: **"Create a small beach-themed website with two HTML files and one CSS file."**(2)  
  - [index.html](web-content/index.html) - the home page  
  - [about.html](web-content/about.html) - a page dedicated to explaining about the beach  
  - [styles.css](web-content/styles.css) - the CSS style file


#### Explanation of the contents described in the Dockerfile

The Dockerfile for this repository/docker image can be found here: [Dockerfile](Dockerfile)

- `FROM httpd:2.4`: Describes the base of our *Docker* image as the official *Docker* image for *Apache HTTP Server*, specifically version `2.4`.(5)  
- `COPY web-content/ /usr/local/apache2/htdocs/`: Copies all content in the `web-content` directory and puts it inside our container, where Apache looks for our website files.(5)


### Building and Pushing a Docker Image

#### How to build the Docker image locally and push it to the Docker Repository

In the root of your repository, run the following commands in this order:

1. `docker build -t historyvariety/beachwebsite:latest .` - builds the Docker image locally  
2. `docker tag historyvariety/beachwebsite:latest historyvariety/project4:latest` - tags the image for *Docker Hub*. I used `latest` as the default, but you can change that to be specific; it's just the version identifier
3.  `docker login -u historyvariety`: Login to Docker using your *PAT*: to set up a *PAT*, see here: [PAT Setup Guide](#DockerHub-Personal-Access-Token-(PAT)-Setup-Guide))
4.  `docker push historyvariety/project4:latest`: Pushes the image to your repository

### Guide to Running a Container to Serve the Web Application
In your terminal, run the following command: 
- `docker run -d -p 80:80 historyvariety/project4:latest`: this will run the container in detached mode, mapping container port 80 to the host port 80.
After running that command, you should be able to view your website at: `http://<your-ec2-public-ip>`. For me, I created a new instance and viewed it at `http://http://98.92.100.139/`
If you would like to see a list of your containers, run the command: `docker ps`
If you want to stop the container, run the command: `docker stop <container_id>`

#### Link to my DockerHub Repo
[My Dockerhub Repository](https://hub.docker.com/r/historyvariety/project4)

## Configuring GitHub Repository Secrets

#### DockerHub-Personal-Access-Token-(PAT)-Setup-Guide

1. Log in to DockerHub  
2. Go to **DockerHub -> Account Settings -> Security -> New Access Token**  
3. Give your token a descriptive but short name: `Project4`  
4. Choose the scope. I recommend the **Read & Write scope**, which allows *GitHub actions* to push and pull images safely to *Dockerhub*
5. Copy the token (make sure to store it somewhere because you will not have access to it again) — you will use it as a secret in our *GitHub* repository
6. *Docker* will run you through how to log in, but essentially type `docker login -u yourusername` into the command line, or copy the command from Docker  
7. Copy the PAT password Docker gives you, and paste it in when asked for the password on the command line.

### Setting up Repository Secrets in GitHub
1. Go to your repository -> **Settings -> Secrets and variables -> Actions -> New repository secret**
2. Create two secrets with the following information:
    - **DOCKER_USERNAME** → your DockerHub username  
    - **DOCKER_TOKEN** → your DockerHub PAT that was generated
  
We created these secrets to allow GitHub Actions to authenticate with DockerHub without exposing our credentials in code. It helps with security!(6)
  
## Continuous Integration with GitHub Actions

### Workflow-Triggers
My workflow triggers on any `push` to the `main` branch of the repository:
```
# GitHub Actions workflow name
name: Docker-Login-Build-Push

# Event trigger(s)
on:
  # Triggers only on pushes to main branch
  push:
    branches: [main]
```


### Workflow-Steps
The workflow file `gitactions.yml` with workflow `Docker-Login-Build-Push` performs the steps:
  1. `Checkout repository`: `uses: actions/checkout@v3` to get the latest code.
  2. `Login to DockerHub`: `uses: docker/login-action@v2` with the GitHub secrets to log in to *DockerHub*
  3. `Build and push Docker image`: `uses: docker/build-push-action@v5` to build and push the *Docker* image.
      - Builds the image using the repository root as the `context  .`(7)
      - Pushes the Docker image using the tag `latest`
  [Link to Github workflow file](web-content/index.html)
### Values to update for Another Repository

  - Change `DOCKER_HUB_REPO` in `env`: to your repository name.
  - Update the `Docker tag` under `tags`: to match your *DockerHub* username and image.
  - Update secrets if needed to match your *DockerHub* credentials.

### Testing and Verification Guide

1. Testing the Workflow
   - In your terminal, `push` a change.
   - Navigate to your GitHub repository webpage, and check the *Actions* for the Workflow status.
   - Confirm everything is completed properly and looks good; it should have checkmarks for every task completed.
2. Verifying the Image was pushed to Docker
   - To do this, just run your image locally!
   ```
     docker pull <dockerhub-username>/project4:latest
     docker run -it --rm <dockerhub-username>/project4:latest
   ```
3. [My Dockerhub Repository](https://hub.docker.com/r/historyvariety/project4)


### Diagram


### Resources
1. Grammarly -> Spellchecked and fixed grammatical errors.
2. ChatGPT (GPT-5.1) - Prompt: "Create a small beach-themed website with two HTML files and one CSS file."
3. https://github.com/WSU-kduncan/ceg3120f25-Historyvariety/tree/main/Project3 -> Took all my Dockerfile instructions from there, plus my website files from it
4. https://docs.docker.com/build/concepts/dockerfile/ -> Used to define what the Dockerfile is. (Wanted to upgrade these descriptions to be better than the ones in Project 3)
5. https://docs.docker.com/build/concepts/dockerfile/
6. https://docs.github.com/en/actions/how-tos/write-workflows/choose-what-workflows-do/use-secrets -> showed me how to set up secrets and explained why we use them.
7. https://docs.github.com/en/actions/reference/workflows-and-actions/contexts -> Context . used in git actions file
