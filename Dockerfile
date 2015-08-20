FROM ruby:2.2.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN mkdir /myapp
WORKDIR /myapp
ADD Gemfile* /myapp/
ENV BUNDLE_GEMFILE=/myapp/Gemfile \
  BUNDLE_JOBS=2 \
    BUNDLE_PATH=/bundle

RUN bundle install

ADD . /myapp
