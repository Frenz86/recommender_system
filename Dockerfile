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

WORKDIR /app
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
EXPOSE 5000
COPY . .
CMD ["flask", "run"]


