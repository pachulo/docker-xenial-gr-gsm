FROM pachulo/docker-xenial-gnuradio-rtl-toolkit:latest

LABEL version="1.0"

MAINTAINER Marc Peña Segarra <segarrra@gmail.com>

RUN git clone --depth 1 https://github.com/ptrkrysik/gr-gsm/ && \
        cd gr-gsm && \
        mkdir build && \
        cd build && \
        cmake .. && \
        make && \
        make install

COPY files/config.conf /root/.gnuradio/config.conf

# Optional: you should run it in your system once to get the config
#COPY files/volk_config-latitude-e6510 /root/.volk/volk_config

COPY files/grgsm_livemon_wireshark.sh /root/grgsm_livemon_wireshark.sh

ENTRYPOINT  ["/bin/bash"]
