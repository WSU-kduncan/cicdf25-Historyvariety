# Project 4 - Continous Integration
Brianna Perdue

## Details

***Project Description***

This Project was used to create...


***DockerFile and Website Content***


**What is a Dockerfile? And what are the contents of the Dockerfile in this Repository?**

  - A Dockerfile is: "*A Dockerfile is a text file containing instructions for building source code, crucial for automated, multi-layer image builds.*"(4)

 ***What is this Website? And what are the contents?***

  - ([web-content folder](web-content)) - contains the files to portray a beach-themed website, created by Chat.gpt using the prompt: **"Create a small beach-themed website with two HTML files and one CSS file."**(2)
    - ([index.html](web-content/index.html)) - the home page.
    - ([about.html](web-content/about.html)) - a page dedicated to explaining about the beach.
    - ([styles.css](web-content/styles.css))  - the CSS style file.
  
***Explanation of the contents described in: ([Dockerfile](Dockerfile))***

  - `FROM httpd:2.4`: Describes the base of our *Docker* image as the official *Docker* image for *Apache HTTP Server*, specifically version `2.4`.(5)
  - `COPY web-content/ /usr/local/apache2/htdocs/`: Copies all content in the `web-content` directory and puts it inside our container, where Apache looks for our website files.(5)

***Build and Push Image***

```
  docker build -t historyvariety/beachwebsite:latest .
  docker tag historyvariety/beachwebsite:latest historyvariety/project4:latest
  docker login -u  (username)
  docker push historyvariety/project4:latest
```

***Creating a DockerHub Personal Access Token (PAT)***
  1. Log in to `Dockerhub`
  2. Go to `DockerHub` → `Account Settings` → `Security` → `New Access Token`
  3. Give your token a descriptive but short name: `Project4`
  4. Choose the scope. I recommend the `Read & Write scope`, which allows you to push and pull images safely.
  5. Copy the token — you will use it in place of your password when running docker login.
  6. *Docker* will run you through how to log in, but essentially type `docker login -u yourusername` into the command line, or copy the command from *Docker*. 
  7. Copy the PAT password Docker gives you, and paste it in when asked for the password on the command line.

***Link to my Dockerhub Repo***: https://hub.docker.com/r/historyvariety/project4


## Diagram

### Resources
1. Grammarly -> Spellchecked and fixed grammatical errors.
2. ChatGPT (GPT-5.1) - Prompt: "Create a small beach-themed website with two HTML files and one CSS file."
3. https://github.com/WSU-kduncan/ceg3120f25-Historyvariety/tree/main/Project3 -> Took all my Dockerfile instructions from there, plus my website files from it
4. https://docs.docker.com/build/concepts/dockerfile/ -> Used to define what the Dockerfile is. (Wanted to upgrade these descriptions to be better than the ones in Project 3)
5. https://docs.docker.com/build/concepts/dockerfile/
