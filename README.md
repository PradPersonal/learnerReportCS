# uild Applicatio
  > aws ecr get-login-password --region ca-central-1 | docker login --username AWS --password-stdin 975050024946.dkr.ecr.ca-central-1.amazonaws.com
  > docker build -t lrcs-frontend .
  > docker tag lrcs-frontend:latest 975050024946.dkr.ecr.ca-central-1.amazonaws.com/lrcs-frontend:latest
  > docker push 975050024946.dkr.ecr.ca-central-1.amazonaws.com/ecr-prad:latest




# 1. Containerize Your Applications
  - Create a Dockerfile for both your frontend and backend applications. This defines how to build the container images. 
  -  - For Backend & Frontend: Navigate to each service's directory and run
       > docker build -t your_dockerhub_username/service-name:tag ..
  -  - Push Images: Log in to your container registry and push the images:
       > aws ecr get-login-password --region ca-central-1 | docker login --username AWS --password-stdin 975050024946.dkr.ecr.ca-central-1.amazonaws.com\
       > docker build -t lrcs-assign-fronted .
       > docker push your_dockerhub_username/service-name:tag. 
