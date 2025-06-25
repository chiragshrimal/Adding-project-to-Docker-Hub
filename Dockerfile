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

# beclow image toh always hi cached rhegi atleast ek bar build krne ke bad 
FROM node:22-alpine

# if we want any other installation then we can do here 
# like 
# RUN install go language

# konse working directory  m source code aayege 
WORKDIR /app

# this the way to write dockerfile in the eficient way 
# because generally this file dont chage again and agin 
COPY package*.json ./


# based on project dependency
# because we have simple based on js project
# we want this only run when package.json will change 
#  if dependency will not change then why we have to build again just cached it 
RUN  npm install

# below this for typescript 
# RUN npm run build 



# copy all the file present 
# it also copy node_modeules
# but we dont copy nodr_modules so can include this in the dockerignore file 
COPY . .



# this image will run on this port inside the container 
EXPOSE 3000

# above script will run when image created 
# The node_modules directory is created during the image build process, not when the container runs.

# below script will run when when you are creating instance of an iamge 
# mean  when you running the container 
CMD [ "node","index.js" ]






# concept of  layer

# puri ki puri image ek sath build nhi hoti hai 
# images layers m build hoti hai 
# jis layer m change nhi hua hai wo cached rhti hai 
# or jis layer m change hua hai wo layer or uske bad ki sabhi layers cached nhi hoti hai fir se build hoti hai 
# or is bar time jyada lgega generally 


