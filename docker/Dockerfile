FROM chinachu/mirakurun:latest AS build
WORKDIR /
# add recpt1
RUN apt update -qq && \
    apt install -qq -y \
        git-core \
        autoconf \
        && \
    git clone --depth=1 https://github.com/stz2012/recpt1.git recpt1 && \
    cd recpt1/recpt1 && \
    ./autogen.sh && \
    ./configure --enable-b25 && \
    make && \
    make install && \
    cd / && \
    rm -rf /recpt1 && \
# add Chinachu
    mkdir /Chinachu && \
    cd /Chinachu && \
    apt install -qq -y \
        build-essential \
        curl \
        git-core \
        vainfo \
        python \
        wget \
        && \
    git clone --depth=1 https://github.com/Chinachu/Chinachu.git . && \
    mkdir ./log && \
    chmod 777 -R ./log && \
    echo 1 | ./chinachu installer


FROM chinachu/mirakurun:latest
WORKDIR /
# add run script
COPY ./run.sh /run.sh
# add recpt1
COPY --from=build /usr/local/bin/recpt1         /usr/local/bin/recpt1
COPY --from=build /usr/local/bin/recpt1ctl      /usr/local/bin/recpt1ctl
COPY --from=build /usr/local/bin/checksignal    /usr/local/bin/checksignal
# script permission
RUN chmod +x \
        /run.sh \
        /app/docker/container-init.sh \
        /usr/local/bin/recpt1 \
        /usr/local/bin/recpt1ctl \
        /usr/local/bin/checksignal \
        && \
# add pm2
    npm install pm2 -g && \
    pm2 startup
# add chinachu
COPY --from=build /Chinachu/ /Chinachu/

# add config file of chinachu
COPY ./chinachu-config.json /Chinachu/config.json

#### Optional ####
#### To my RecordedCommand ####
RUN apt update -qq && \
    apt install -qq -y --no-install-recommends \
        # to parse json
        jq \
        # to git
        git-core \
        openssh-client \
        # to send twitter/slack
        ca-certificates \
        php7.3-cli \
        php7.3-mbstring \
        && \
# apt clean
    apt clean && \
    rm -rf /var/lib/apt/lists/*
#### End ####

EXPOSE 40772 9229 10772 20772

CMD ["/run.sh"]
