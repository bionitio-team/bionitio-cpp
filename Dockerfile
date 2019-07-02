# ubuntu bionic
FROM ubuntu:18.04 
WORKDIR /bionitio
COPY . .

RUN apt-get update && apt-get install -y gcc cmake libboost-program-options-dev libboost-log-dev 
ENV BIONITIO_CPP_PATH /bionitio/src/
WORKDIR $BIONITIO_CPP_PATH 
RUN wget http://packages.seqan.de/seqan-library/seqan-library-2.1.1.tar.xz 
RUN tar xvf seqan-library-2.1.1.tar.xz
RUN mkdir bionitio-build
WORKDIR $BIONITIO_CPP_PATH//bionitio-build
RUN cmake $BIONITIO_CPP_PATH -DCMAKE_MODULE_PATH=$BIONITIO_CPP_PATH/seqan-library-2.1.1/share/cmake/Modules/ -DSEQAN_INCLUDE_PATH=$BIONITIO_CPP_PATH/seqan-library-2.1.1/include/ -DCMAKE_CXX_FLAGS=-std=c++11
RUN make

ENTRYPOINT ["bionitio"]
