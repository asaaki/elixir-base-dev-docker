FROM alpine:3.2

RUN echo 'http://dl-4.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories

RUN apk update && apk upgrade && rm -rf /var/cache/apk/*

RUN apk --update add \
    musl musl-utils \
    libcrypto1.0 libssl1.0 ncurses-libs \
    erlang erlang-asn1 erlang-common-test erlang-compiler erlang-cosevent \
    erlang-coseventdomain erlang-cosfiletransfer erlang-cosnotification \
    erlang-cosproperty erlang-costime erlang-costransaction erlang-crypto \
    erlang-debugger erlang-dev erlang-dialyzer erlang-diameter erlang-edoc \
    erlang-eldap erlang-erl-docgen erlang-erl-interface erlang-erts erlang-et \
    erlang-eunit erlang-gs erlang-hipe erlang-ic erlang-inets erlang-kernel \
    erlang-megaco erlang-mnesia erlang-observer erlang-odbc erlang-orber \
    erlang-os-mon erlang-ose erlang-otp-mibs erlang-parsetools erlang-percept \
    erlang-public-key erlang-reltool erlang-runtime-tools erlang-sasl \
    erlang-snmp erlang-ssh erlang-ssl erlang-stdlib erlang-syntax-tools \
    erlang-test-server erlang-tools erlang-typer erlang-webtool erlang-xmerl \
    erlang-jinterface \
    elixir \
    curl wget git \
    gcc make libc-dev libgcc clang llvm llvm-libs \
    && rm -rf /var/cache/apk/*

RUN mix local.hex --force && mix local.rebar --force

CMD ["/bin/sh"]
