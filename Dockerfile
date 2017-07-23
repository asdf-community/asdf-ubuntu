FROM vborja/asdf-ubuntu:nodejs-8.2.1 as node

FROM vborja/asdf-ubuntu:elixir-1.5.0-rc.2-otp-20
COPY --from=node /asdf/.asdf/toolset/nodejs .asdf/toolset/nodejs

USER root
RUN bash .asdf/toolset/nodejs/build-deps
USER asdf
RUN asdf-install-toolset nodejs
