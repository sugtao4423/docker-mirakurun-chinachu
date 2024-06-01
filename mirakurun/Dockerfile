FROM chinachu/mirakurun:latest AS build
WORKDIR /
# add recpt1
RUN apt update -qq && \
    apt install -y git-core autoconf && \
    git clone --depth=1 https://github.com/stz2012/recpt1.git recpt1 && \
    cd recpt1/recpt1 && \
    ./autogen.sh && \
    ./configure --enable-b25 && \
    make && \
    make install

FROM chinachu/mirakurun:latest
COPY --from=build /usr/local/bin/recpt1         /usr/local/bin/recpt1
COPY --from=build /usr/local/bin/recpt1ctl      /usr/local/bin/recpt1ctl
COPY --from=build /usr/local/bin/checksignal    /usr/local/bin/checksignal
RUN chmod +x \
        /usr/local/bin/recpt1 \
        /usr/local/bin/recpt1ctl \
        /usr/local/bin/checksignal
