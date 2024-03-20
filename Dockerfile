FROM ubuntu:22.04

WORKDIR /app/

RUN apt-get update
RUN apt-get install -y git build-essential cmake libuv1-dev libssl-dev libhwloc-dev

RUN git clone https://github.com/xmrig/xmrig.git

RUN mkdir -p /app/xmrig/build
RUN cd /app/xmrig/build && cmake ..
RUN cd /app/xmrig/build && make

ENTRYPOINT [ "/app/xmrig/build/xmrig" ]
