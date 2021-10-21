FROM wisteriahill/ros:foxy-ros-base-l4t-r32.4.4
RUN apt-get update && apt-get install -y \
    vim \
    git

RUN git clone https://github.com/eProsima/Micro-XRCE-DDS-Agent.git
WORKDIR Micro-XRCE-DDS-Agent

RUN git checkout -b v1.3.0 refs/tags/v1.3.0
RUN mkdir build && cd build
RUN cmake ..
RUN make
RUN make install
RUN ldconfig /usr/local/lib/
