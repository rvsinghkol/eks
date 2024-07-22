FROM ubuntu:18.04
MAINTAINER rvravi1@gmail.com

# Install apache2, zip, and unzip
RUN apt-get update && \
    apt-get install -y apache2 zip unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy the website zip file to the web server directory
COPY photogenic.zip /usr/share/nginx/

# Set the working directory
WORKDIR /usr/share/nginx/

# Unzip the website content
RUN unzip photogenic.zip

# Copy the unzipped content to the web server directory and clean up
RUN cp -rvf photogenic/* . && \
    rm -rf photogenic photogenic.zip

# Expose port 80
EXPOSE 80

# Start the apache2 server in the foreground
CMD ["apachectl", "-D", "FOREGROUND"]

