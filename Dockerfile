FROM vborja/asdf-ubuntu:latest

ADD nodejs .asdf/toolset/nodejs

USER root
RUN bash .asdf/toolset/nodejs/build-deps
USER asdf
RUN asdf-install-toolset nodejs
