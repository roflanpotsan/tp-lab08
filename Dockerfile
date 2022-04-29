FROM ubuntu:22.04

RUN apt update
RUN apt install -yy gcc g++ cmake

COPY . project/
WORKDIR project

RUN cmake -B build -DCMAKE_INSTALL_PREFIX=install_folder
RUN cmake --build build
RUN cmake --build build --target install

#ENV LOG_PATH /home/logs/log.txt
#VOLUME /home/logs
WORKDIR install_folder/bin
ENTRYPOINT ./test_project
