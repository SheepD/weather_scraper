FROM elixir:1.13.4-otp-25-alpine as builder

RUN yes | mix local.hex --force
RUN yes | mix local.rebar --force

RUN apk add --no-cache --update build-base

ENV APP_HOME /app
RUN mkdir $APP_HOME
ADD . /app
WORKDIR $APP_HOME

RUN mix do deps.get

EXPOSE 4001
CMD ["mix", "run", "--no-halt"]
