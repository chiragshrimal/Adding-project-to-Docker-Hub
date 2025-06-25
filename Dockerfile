# in this  file we are creating docker file 
# so that we can make image of this project 
# and push on the docker registry (docker hub)
# so that everyone can run this project on own sysytem whithout instaling any dependency 

# if you want to do from scratch than  write below command
# FROM  scratch 

# if you want to build this image using another image which is existing in the registry
# but you can use only one base image  

# alpline is the lighter version of nodejs 
# node:22-alpine  is the image present in docker hub
FROM node:22-alpine

# if we want any other installation then we can do here 
# like 
# RUN install go language

# konse working directory  m source code aayege 
WORKDIR /app

# copy all the file present 
# it also copy node_modeules
# but we dont copy nodr_modules so can include this in the dockerignore file 
COPY . .

# based on project dependency
# because we have simple based on js project 
RUN  npm install

# below this for typescript 
# RUN npm run build 

# this image will run on this port inside the container 
EXPOSE 3000

# above script will run when image created 


# below script will run when when you are creating instance of an iamge 
# mean  when you running the container 
CMD [ "node","index.js" ]



