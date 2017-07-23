FROM vborja/asdf-ubuntu:latest

ADD ruby .asdf/toolset/ruby/

USER root
RUN  bash .asdf/toolset/ruby/build-deps
USER asdf
RUN  asdf-install-toolset ruby

