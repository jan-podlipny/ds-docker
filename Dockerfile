# Using ubuntu 18.04 as base image
FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install --no-install-recommends -y apt-utils software-properties-common curl nano unzip openssh-server
RUN apt-get install -y python3 python3-dev python-distribute python3-pip git

# metadata
#version = '1.0'
LABEL maintainer = 'Jan Podlipny <jpodlipny@gmail.com>'

# main python packages
RUN pip3 install --upgrade pip
RUN pip3 install --upgrade numpy scipy matplotlib scikit-learn pandas seaborn plotly jupyter statsmodels

# jupyter notebook
RUN pip3 install notebook==5.6.0
RUN pip3 install --upgrade nose tqdm pydot pydotplus watermark geopy joblib pillow

# Graphviz, visualizing trees
RUN apt-get -y install graphviz

COPY docker_files/entry-point.sh /
# Final setup: directories, permissions, etc
RUN mkdir -p /home/user && \

WORKDIR /home/user
