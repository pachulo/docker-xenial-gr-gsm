FROM pachulo/xenial-gnuradio-rtl-toolkit:latest

LABEL version="1.0"

MAINTAINER Marc Peña Segarra <segarrra@gmail.com>

RUN git clone --depth 1 https://github.com/ptrkrysik/gr-gsm/ && \
        cd gr-gsm && \
        mkdir build && \
        cd build && \
        cmake .. && \
        make && \
        make install && \
        ldconfig

COPY files/config.conf /root/.gnuradio/config.conf

# Optional: you should run it in your system once to get the config
#COPY files/volk_config-latitude-e6510 /root/.volk/volk_config

ADD http://www.ks.uni-freiburg.de/download/misc/gsmframecoder.tar.gz /
RUN tar xvf /gsmframecoder.tar.gz

COPY files/grgsm_livemon_wireshark.sh /root/grgsm_livemon_wireshark.sh

ENTRYPOINT  ["/bin/bash"]
