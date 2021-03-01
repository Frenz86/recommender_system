# base image
# a little overkill but need it to install dot cli for dtreeviz
FROM ubuntu:18.04

# ubuntu installing - python, pip, graphviz, nano, libpq (for psycopg2)
RUN apt-get update &&\
    apt-get install python3.8 -y &&\
    apt-get install python3-pip -y &&\
    apt-get install graphviz -y

RUN \ 
    pip3 install --no-cache-dir Cython
RUN pip3 install --upgrade pip
RUN pip3 install Cython

# Flask

RUN mkdir /app
# navigate to this work directory
WORKDIR /app
#Copy all files
COPY . .
# Install dependencies
RUN pip3 install -r requirements.txt
# Run
CMD ["python3","app.py"]


