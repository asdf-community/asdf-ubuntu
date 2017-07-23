FROM ubuntu:latest

LABEL maintainer="Victor Borja <vborja@apache.org>"
LABEL updated_at=2017-08-23

RUN apt-get update -q && apt-get install -y git

RUN adduser --shell /bin/bash --home /asdf --disabled-password asdf
ENV PATH="${PATH}:/asdf/.asdf/shims:/asdf/.asdf/bin"

USER asdf
WORKDIR /asdf

COPY asdf-install-toolset /usr/local/bin

ONBUILD USER asdf
ONBUILD RUN git clone --depth 1 https://github.com/asdf-vm/asdf.git $HOME/.asdf && \
    echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bashrc && \
    echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.profile && \
    source ~/.bashrc && \
    mkdir -p $HOME/.asdf/toolset
