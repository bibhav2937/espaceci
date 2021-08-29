# Problem Statement

Description: Create a sample web page and deploy it as a microservice in a kubernetes cluster
1. Create two versions of a sample webpage (html) using apache/nginx
    a. Version 1 html content - “Welcome to sample App Ver-1”
    b. Version 2 html content - “Welcome to sample App Ver-2”
2. Use Helm to create version1 and version 2 packages.
3. Create seperate CI-CD pipeline for package build and deployment.
4. Deploy version 1 and the version-1 html content should be accessible in the browser (local). Document the steps followed in detail with screenshots. Repeat the same for deploying version 2.
5. For accessing web pages in the browser, expose the service using nodeport or cluster IP as convenient.
6. Deployment pipeline should deploy on a minikube or single node kubernetes cluster
    a. Pipeline should be created using Jenkins
    b. Use scripting languages for package build and deployment (Preferred: Groovy, Python, Bash)

# Solution
The solution is as given below:
    * [architecture](#architecture))

# System Architecture <a name="architecture"></a>
![Architecture](espacewebapp.png)

# App Development 

# App Update

# User journey

