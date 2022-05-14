FROM node:alpine

WORKDIR /usr/src/app

# install and cache app dependencies
COPY package*.json ./

# forces ng to be installed globally
RUN echo n | npm install -g --silent @angular/cli @angular-devkit/build-angular

COPY . .

# create the node_modules folder with required dependencies 
RUN npm install

EXPOSE 4200

CMD ["ng", "serve", "--host", "0.0.0.0"]

# BUILD:
# docker build -t nutrition_label .

# RUN:
# docker run --rm -p 4200:4200/tcp -v $(pwd):/usr/src/app nutrition_label

# CLEAN INSTALL:
# If you have just cloned the code, the node_module folder is missing/ignored 
# it will be on the image, but not locally and the above mounts the local folder
# just run the following, and `npm install` on the bash.

# docker run -it --rm -v $(pwd):/usr/src/app --entrypoint "/bin/sh" nutrition_label