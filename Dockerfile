FROM ubuntu:20.04

LABEL maintainer="Victor Borja <vborja@apache.org>"
LABEL updated_at=2020-06-23

RUN apt-get update -qq \
    && apt-get install -y \
               curl       \
               git        \
    && adduser --quiet             \
               --disabled-password \
               --shell /bin/bash   \
               --home /asdf        \
               --gecos "User"      \
               asdf

ENV PATH="${PATH}:/asdf/.asdf/shims:/asdf/.asdf/bin"

USER asdf
WORKDIR /asdf

COPY asdf-install-toolset /usr/local/bin

ONBUILD USER asdf
ONBUILD RUN git clone --depth 1                     \
                https://github.com/asdf-vm/asdf.git \
                $HOME/.asdf                         \
            && echo '. $HOME/.asdf/asdf.sh' >> $HOME/.bashrc \
            && echo '. $HOME/.asdf/asdf.sh' >> $HOME/.profile
