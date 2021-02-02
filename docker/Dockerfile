FROM chinachu/mirakurun:latest
WORKDIR /
# add recpt1
RUN apt update -qq && \
    apt install -y git-core autoconf wget && \
    git clone https://github.com/stz2012/recpt1.git recpt1 && \
    cd recpt1/recpt1 && \
    ./autogen.sh && \
    ./configure --enable-b25 && \
    make && \
    make install && \
    cd / && \
    rm -rf /recpt1 && \
# add mirakurun start script
    wget https://raw.githubusercontent.com/Chinachu/Mirakurun/master/docker/container-init.sh && \
    chmod +x /container-init.sh && \
# add Chinachu
    mkdir /Chinachu && \
    cd /Chinachu && \
    apt install -qq -y build-essential curl git-core vainfo python wget && \
    apt clean && \
    git clone https://github.com/Chinachu/Chinachu.git . && \
    npm install pm2 -g && \
    pm2 startup && \
    mkdir ./log && \
    chmod 777 -R ./log && \
    echo 1 | ./chinachu installer
COPY ./run.sh /run.sh
RUN chmod +x /run.sh

COPY ./chinachu-config.json /Chinachu/config.json

#### Optional ####
#### To my RecordedCommand ####
RUN apt install -qq -y php7.3-cli php7.3-mbstring jq
#### End ####

EXPOSE 40772 9229 10772 20772

CMD ["/run.sh"]
