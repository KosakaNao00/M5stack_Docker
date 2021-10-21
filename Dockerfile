FROM wisteriahill/ros:foxy-ros-base-l4t-r32.4.4
RUN apt update && \
    apt upgrade -y && \
    apt install vim && \
    apt install git

RUN git clone https://github.com/eProsima/Micro-XRCE-DDS-Agent.git
WORKDIR Micro-XRCE-DDS-Agent
RUN git checkout -b v1.3.0 refs/tags/v1.3.0 &&\
mkdir build && cd build
cmake ..
make
make install
ldconfig /usr/local/lib/