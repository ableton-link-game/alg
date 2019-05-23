FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install -y curl
RUN apt-get install -y make

WORKDIR /

RUN curl -OsSL https://cmake.org/files/v3.5/cmake-3.5.2-Linux-x86_64.tar.gz
RUN tar -xzf cmake-3.5.2-Linux-x86_64.tar.gz -C /opt

RUN ln -s /opt/cmake-3.5.2-Linux-x86_64/bin/cmake /usr/local/bin/
RUN ln -s /opt/cmake-3.5.2-Linux-x86_64/bin/ccmake /usr/local/bin/
RUN ln -s /opt/cmake-3.5.2-Linux-x86_64/bin/cmake-gui /usr/local/bin/
RUN ln -s /opt/cmake-3.5.2-Linux-x86_64/bin/cpack /usr/local/bin/
RUN ln -s /opt/cmake-3.5.2-Linux-x86_64/bin/ctest /usr/local/bin/

# CMD bash

COPY link /src/link

WORKDIR /src/link/
RUN mkdir -p build
WORKDIR /src/link/build

RUN apt-get install -y build-essential gcc

RUN cmake ..
RUN cmake --build .

CMD ["bash"]
