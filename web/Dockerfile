FROM frolvlad/alpine-python3
MAINTAINER ponteineptique <thibault.clerice[@]uni-leipzig.de>

# Install required packages
RUN apk add --no-cache python3-dev gcc linux-headers libxml2 libxml2-dev libxslt libxslt-dev musl musl-dev

# Sets up locales to avoid decode issue in python
ENV LANG C.UTF-8

WORKDIR /code/

# Get the main app and configuration files
ADD ./workdir .
RUN pip3 install -r requirements-py3.txt

# Set up volumes
VOLUME /opt/data
VOLUME /opt/static

RUN ln -s /opt/static/assets/templates

# Expose right ports
EXPOSE 5000

# start supervisor to run our wsgi server
CMD ["bash"]