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
 && apt-get clean \
 && rm -r /var/lib/apt/lists/*

RUN gem install --no-document jekyll bundler s3_website

ENV JEKYLLPATH /var/jekyll

VOLUME $JEKYLLPATH

EXPOSE 8496

WORKDIR $JEKYLLPATH

CMD ["tail", "-f", "/dev/null"]

