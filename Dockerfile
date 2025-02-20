FROM ubuntu:18.04
MAINTAINER rvravi@gmail.com

# Install apache2, zip, and unzip
RUN apt-get update && \
    apt-get install -y apache2 zip unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy the website zip file to the web server directory
COPY photogenic.zip /var/www/html/

# Set the working directory
WORKDIR /var/www/html/

# Unzip the website content
RUN unzip photogenic.zip

# Copy the unzipped content to the web server directory and clean up
RUN cp -rvf photogenic/* . && \
    rm -rf photogenic photogenic.zip

# Expose port 80
EXPOSE 80

# Start the apache2 server in the foreground
CMD ["apachectl", "-D", "FOREGROUND"]

