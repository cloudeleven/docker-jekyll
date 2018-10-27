FROM ubuntu:18.10

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update \
 && apt-get install -y -q --no-install-recommends \
    build-essential \
    ruby-dev \
    rubygems \
    openjdk-8-jre-headless \
    vim \
    git \
    zlib1g-dev \
    npm \
    locales \
 && apt-get clean \
 && rm -r /var/lib/apt/lists/*

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN gem install --no-document jekyll bundler s3_website

ENV JEKYLLPATH /var/jekyll

VOLUME $JEKYLLPATH

WORKDIR $JEKYLLPATH


