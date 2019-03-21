FROM ubuntu:16.04

RUN apt-get update && apt-get -y install g++ gcc cmake git
RUN mkdir /roki_build
WORKDIR /roki_build
RUN git clone https://github.com/hakuturu583/zeda.git
RUN git clone https://github.com/hakuturu583/zm.git
RUN git clone https://github.com/hakuturu583/zeo.git
RUN git clone https://github.com/hakuturu583/roki.git
RUN mkdir zeda_build
RUN mkdir zm_build
RUN mkdir zeo_build
RUN mkdir roki_build
WORKDIR /roki_build/zeda_build
RUN cmake ../zeda/. && make -j $(nproc) && make install
WORKDIR /roki_build/zm_build
RUN cmake ../zm/. && make -j $(nproc) && make install
WORKDIR /roki_build/zeo_build
RUN cmake ../zeo/. && make -j $(nproc) && make install
WORKDIR /roki_build/roki_build
RUN cmake ../roki/. && make -j $(nproc) && make install
WORKDIR /roki_build